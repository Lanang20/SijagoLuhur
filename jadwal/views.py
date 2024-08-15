from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import Event, Tempat, Fasilitas, Role, User
from django.shortcuts import get_object_or_404
from django.core.mail import send_mail
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from datetime import datetime
from django.utils.timezone import now, localtime
from babel.dates import format_datetime


# Create your views here.
def user_login(request):
    msg = None
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('dashboard')  # Redirect to the dashboard page on successful login
        else:
            msg = 'Username atau Password salah'

    return render(request, 'index.html', {'msg': msg})

def event_list(request):
    tempat_id = request.GET.get('tempat_id')
    
    if request.user.is_superuser:
        if tempat_id:
            events = Event.objects.filter(status='disetujui', id_tempat=tempat_id).all()
        else:
            events = Event.objects.filter(status='disetujui').all()
    elif request.user.is_staff:
        # Assume the user is an Administrator and has an associated Role
        role = Role.objects.get(user=request.user)
        if tempat_id:
            events = Event.objects.filter(status='disetujui', id_tempat=tempat_id).all()
        else:
            events = Event.objects.filter(status='disetujui', id_tempat=role.id_tempat).all()
    else:
        if tempat_id:
            events = Event.objects.filter(status='disetujui', id_tempat=tempat_id).all()
        else:
            events = Event.objects.filter(status='disetujui').all()

    event_list = []
    for event in events:
        event_list.append({
            'title': event.nama,
            'start': localtime(event.tanggal_mulai).strftime('%Y-%m-%dT%H:%M:%S'),  # ISO format
            'end': localtime(event.tanggal_selesai).strftime('%Y-%m-%dT%H:%M:%S'),  # ISO format
            'description': event.deskripsi,
            'place': event.id_tempat.nama,
            'formatted_start': format_datetime(localtime(event.tanggal_mulai), "EEEE, d MMMM yyyy HH:mm", locale='id_ID') + " WIB",  # Indonesian format
            'formatted_end': format_datetime(localtime(event.tanggal_selesai), "EEEE, d MMMM yyyy HH:mm", locale='id_ID') + " WIB",  # Indonesian format
        })
    return JsonResponse(event_list, safe=False)

def landing_page(request):
    tempat_list = Tempat.objects.all().order_by('nama')  # Mengurutkan berdasarkan nama tempat
    context = {
        'tempat_list': tempat_list,
    }
    return render(request, 'index.html', context)

def tempat_detail(request, tempat_id):
    tempat = get_object_or_404(Tempat, id=tempat_id)
    fasilitas_list = Fasilitas.objects.filter(id_tempat=tempat)
    context = {
        'tempat': tempat,
        'fasilitas_list': fasilitas_list
    }
    return render(request, 'detail.html', context)

def send_email(request):
    if request.method == 'POST':
        # Ambil data dari formulir kontak
        nama = request.POST.get('nama')
        email = request.POST.get('email')
        pesan = request.POST.get('pesan')

        # Kirim email
        send_mail(
            'Pesan dari SIJAGO LUHUR',
            f'Nama Pengirim: {nama}\nEmail Pengirim: {email}\n\nPesan: {pesan}',
            email,  # Email pengirim
            ['pangestuwicaksono891@gmail.com', 'azzamdicky26@gmail.com'],  # Email penerima
            fail_silently=False,
        )
        
        # Kembalikan respons JSON
        return JsonResponse({'message': 'Pesan Anda telah terkirim!'})
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def dashboard(request):
    # Filter event yang akan datang berdasarkan tanggal saat ini
    upcoming_events = Event.objects.filter(status="disetujui", tanggal_mulai__gt=now()).count()
    event_diproses = Event.objects.filter(status="diproses").count()
    total_tempat = Tempat.objects.all().count()
    total_user = User.objects.all().count()
    tempat_list = Tempat.objects.all()
    context = {
        'upcoming_events': upcoming_events,
        'event_diproses': event_diproses,
        'total_tempat': total_tempat,
        'total_user': total_user,
        'tempat_list': tempat_list,
    }
    return render(request, 'dashboard.html', context)

@login_required
def tempat(request):
    tempat_list = Tempat.objects.all().order_by('nama')  # Mengurutkan berdasarkan nama tempat
    context = {
        'tempat_list': tempat_list,
    }
    return render(request, 'tempat.html', context)

@login_required
def tambah_tempat(request):
    if request.method == 'POST':
        nama = request.POST.get('nama')
        deskripsi = request.POST.get('deskripsi')
        foto = request.FILES.get('foto')  # Mengambil file foto dari form

        tempat = Tempat(nama=nama, deskripsi=deskripsi, foto=foto)
        tempat.save()

        return JsonResponse({'message': 'Tempat berhasil ditambahkan!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def edit_tempat(request, tempat_id):
    tempat = get_object_or_404(Tempat, id=tempat_id)
    
    if request.method == 'POST':
        tempat.nama = request.POST.get('nama')
        tempat.deskripsi = request.POST.get('deskripsi')
        if 'foto' in request.FILES:
            tempat.foto = request.FILES.get('foto')
        tempat.save()
        return JsonResponse({'message': 'Tempat berhasil diupdate!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def hapus_tempat(request, id):
    if request.method == 'DELETE':
        tempat = get_object_or_404(Tempat, id=id)
        tempat.delete()
        return JsonResponse({'message': 'Tempat deleted successfully!'}, status=200)
    return JsonResponse({'error': 'Invalid request method'}, status=400)

@login_required
def fasilitas(request):
    if request.user.is_superuser:
        # Admin (superuser) bisa melihat semua data
        fasilitas_list = Fasilitas.objects.all().order_by('objek_retribusi')
        tempat_list = Tempat.objects.all().order_by('nama')  # Ambil semua tempat
    else:
        # Administrator hanya melihat data berdasarkan id_tempat mereka
        fasilitas_list = Fasilitas.objects.filter(id_tempat=request.user.id_role.id_tempat).order_by('objek_retribusi')
        tempat_list = []  # Tidak perlu mengirimkan daftar tempat untuk non-superuser

    context = {
        'fasilitas_list': fasilitas_list,
        'tempat_list': tempat_list
    }
    return render(request, 'fasilitas.html', context)

@login_required
def tambah_fasilitas(request):
    if request.method == 'POST':
        id_tempat = request.POST.get('id_tempat')
        objek_retribusi = request.POST.get('objek_retribusi')
        rincian = request.POST.get('rincian')
        keterangan = request.POST.get('keterangan')

        # Ambil instance Tempat berdasarkan id_tempat
        tempat = get_object_or_404(Tempat, id=id_tempat)

        fasilitas = Fasilitas(id_tempat=tempat, objek_retribusi=objek_retribusi, rincian=rincian, keterangan=keterangan)
        fasilitas.save()

        return JsonResponse({'message': 'Fasilitas berhasil ditambahkan!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def edit_fasilitas(request, fasilitas_id):
    fasilitas = get_object_or_404(Fasilitas, id=fasilitas_id)
    if request.method == 'POST':
        id_tempat = request.POST.get('id_tempat')
        objek_retribusi = request.POST.get('objek_retribusi')
        rincian = request.POST.get('rincian')
        keterangan = request.POST.get('keterangan')

        tempat = get_object_or_404(Tempat, id=id_tempat)

        fasilitas.id_tempat = tempat
        fasilitas.objek_retribusi = objek_retribusi
        fasilitas.rincian = rincian
        fasilitas.keterangan = keterangan
        fasilitas.save()

        return JsonResponse({'message': 'Fasilitas berhasil diupdate!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def hapus_fasilitas(request, id):
    if request.method == 'DELETE':
        fasilitas = get_object_or_404(Fasilitas, id=id)
        fasilitas.delete()
        return JsonResponse({'message': 'Fasilitas deleted successfully!'}, status=200)
    return JsonResponse({'error': 'Invalid request method'}, status=400)

@login_required
def event(request):
    if request.user.is_superuser:
        # Admin (superuser) bisa melihat semua data
        event_list = Event.objects.all().order_by('status', 'tanggal_mulai')
        tempat_list = Tempat.objects.all().order_by('nama')  # Ambil semua tempat
    else:
        # Administrator hanya melihat data berdasarkan id_tempat mereka
        event_list = Event.objects.filter(id_tempat=request.user.id_role.id_tempat).order_by('status', 'tanggal_mulai')
        tempat_list = []  # Tidak perlu mengirimkan daftar tempat untuk non-superuser

    # Format the date to Indonesian format
    formatted_events = []
    for event in event_list:
        formatted_events.append({
            'id': event.id,
            'nama': event.nama,
            'tanggal_mulai': format_datetime(localtime(event.tanggal_mulai), "EEEE, d MMMM yyyy HH:mm", locale='id_ID') + " WIB",
            'tanggal_selesai': format_datetime(localtime(event.tanggal_selesai), "EEEE, d MMMM yyyy HH:mm", locale='id_ID') + " WIB",
            'deskripsi': event.deskripsi,
            'id_tempat': event.id_tempat,
            'status': event.status,
        })

    context = {
        'formatted_events': formatted_events,
        'tempat_list': tempat_list,
        'event_list': event_list
    }
    return render(request, 'event.html', context)

@login_required
def tambah_event(request):
    if request.method == 'POST':
        id_tempat = request.POST.get('id_tempat')
        nama = request.POST.get('nama')
        tanggal_mulai = request.POST.get('tanggal_mulai')
        jam_mulai = request.POST.get('jam_mulai')
        tanggal_selesai = request.POST.get('tanggal_selesai')
        jam_selesai = request.POST.get('jam_selesai')
        deskripsi = request.POST.get('deskripsi')
        status = request.POST.get('status')

        # Parse waktu mulai dan selesai
        mulai = f"{tanggal_mulai} {jam_mulai}"
        selesai = f"{tanggal_selesai} {jam_selesai}"

        tempat = Tempat.objects.get(id=id_tempat)
        Event.objects.create(
            id_tempat=tempat,
            nama=nama,
            tanggal_mulai=mulai,
            tanggal_selesai=selesai,
            deskripsi=deskripsi,
            status=status
        )
        return JsonResponse({'message': 'Event berhasil ditambahkan!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def edit_event(request, event_id):
    event = get_object_or_404(Event, id=event_id)
    if request.method == 'POST':
        id_tempat = request.POST.get('id_tempat')
        nama = request.POST.get('nama')
        tanggal_mulai = request.POST.get('tanggal_mulai')
        jam_mulai = request.POST.get('jam_mulai')
        tanggal_selesai = request.POST.get('tanggal_selesai')
        jam_selesai = request.POST.get('jam_selesai')
        deskripsi = request.POST.get('deskripsi')
        status = request.POST.get('status')
          
        tempat = get_object_or_404(Tempat, id=id_tempat)
        # Parse waktu mulai dan selesai
        mulai = datetime.strptime(f"{tanggal_mulai} {jam_mulai}", '%Y-%m-%d %H:%M')
        selesai = datetime.strptime(f"{tanggal_selesai} {jam_selesai}", '%Y-%m-%d %H:%M')

        event.id_tempat = tempat
        event.nama = nama
        event.tanggal_mulai = mulai
        event.tanggal_selesai = selesai
        event.deskripsi = deskripsi
        event.status = status
        event.save()
        return JsonResponse({'message': 'Event berhasil diupdate!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def edit_status(request, event_id):
    event = get_object_or_404(Event, id=event_id)
    if request.method == 'POST':
        id_tempat = request.POST.get('id_tempat')
        nama = request.POST.get('nama')
        tanggal_mulai = request.POST.get('tanggal_mulai')
        jam_mulai = request.POST.get('jam_mulai')
        tanggal_selesai = request.POST.get('tanggal_selesai')
        jam_selesai = request.POST.get('jam_selesai')
        deskripsi = request.POST.get('deskripsi')
        status = request.POST.get('status')
          
        tempat = get_object_or_404(Tempat, id=id_tempat)
        # Parse waktu mulai dan selesai
        mulai = datetime.strptime(f"{tanggal_mulai} {jam_mulai}", '%Y-%m-%d %H:%M')
        selesai = datetime.strptime(f"{tanggal_selesai} {jam_selesai}", '%Y-%m-%d %H:%M')

        event.id_tempat = tempat
        event.nama = nama
        event.tanggal_mulai = mulai
        event.tanggal_selesai = selesai
        event.deskripsi = deskripsi
        event.status = status
        event.save()
        return JsonResponse({'message': 'Status berhasil diupdate!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def hapus_event(request, id):
    if request.method == 'DELETE':
        event = get_object_or_404(Event, id=id)
        event.delete()
        return JsonResponse({'message': 'Event deleted successfully!'}, status=200)
    return JsonResponse({'error': 'Invalid request method'}, status=400)

@login_required
def role(request):
    role_list = Role.objects.all().order_by('nama')  # Mengurutkan berdasarkan nama role
    tempat_list = Tempat.objects.all().order_by('nama')
    context = {
        'role_list': role_list,
        'tempat_list': tempat_list,
    }
    return render(request, 'role.html', context)

@login_required
def tambah_role(request):
    if request.method == 'POST':
        id_tempat = request.POST.get('id_tempat')
        nama = request.POST.get('nama')

        tempat = Tempat.objects.get(id=id_tempat)
        Role.objects.create(
            id_tempat=tempat,
            nama=nama,
        )
        return JsonResponse({'message': 'Role berhasil ditambahkan!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def edit_role(request, role_id):
    role = get_object_or_404(Role, id=role_id)
    if request.method == 'POST':
        id_tempat = request.POST.get('id_tempat')
        nama = request.POST.get('nama')
        tempat = get_object_or_404(Tempat, id=id_tempat)
        role.id_tempat = tempat
        role.nama = nama
        role.save()
        return JsonResponse({'message': 'Role berhasil diupdate!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def hapus_role(request, id):
    if request.method == 'DELETE':
        role = get_object_or_404(Role, id=id)
        role.delete()
        return JsonResponse({'message': 'Role deleted successfully!'}, status=200)
    return JsonResponse({'error': 'Invalid request method'}, status=400)

@login_required
def user(request):
    user_list = User.objects.all().order_by('username')  # Mengurutkan berdasarkan username user
    role_list = Role.objects.all().order_by('nama')
    context = {
        'user_list': user_list,
        'role_list': role_list,
    }
    return render(request, 'user.html', context)

@login_required
def tambah_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        role_id = request.POST.get('role')

        # Validasi input
        if password1 != password2:
            return JsonResponse({'message': 'Password tidak cocok!'}, status=400)

        # Cek apakah username sudah digunakan
        if User.objects.filter(username=username).exists():
            return JsonResponse({'message': 'Username sudah digunakan!'}, status=400)

        # Buat user baru
        role = Role.objects.get(id=role_id)
        user = User.objects.create(
            username=username,
            email=email,
            password=make_password(password1),
            is_staff=True,  # Pastikan user bisa mengakses admin site
        )
        # Asumsikan bahwa User memiliki hubungan dengan Role
        user.id_role = role
        user.save()

        return JsonResponse({'message': 'User berhasil ditambahkan!'}, status=200)
    
    return JsonResponse({'message': 'Invalid request'}, status=400)

@login_required
def hapus_user(request, id):
    if request.method == 'DELETE':
        user = get_object_or_404(User, id=id)
        user.delete()
        return JsonResponse({'message': 'User deleted successfully!'}, status=200)
    return JsonResponse({'error': 'Invalid request method'}, status=400)

@login_required
def logout_view(request):
    logout(request)
    return redirect('landing_page')