from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import Tempat, Role, User, Fasilitas, Event

class UserAdmin(BaseUserAdmin):
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'email')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
        ('Additional info', {'fields': ('id_role',)}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2', 'id_role', 'is_staff', 'user_permissions'),
        }),
    )

admin.site.register(User, UserAdmin)

class TempatAdmin(admin.ModelAdmin):
    list_display = ('nama', 'deskripsi')
    search_fields = ('nama', 'deskripsi')
    list_filter = ('nama',)

admin.site.register(Tempat, TempatAdmin)

class RoleAdmin(admin.ModelAdmin):
    list_display = ('nama', 'id_tempat')
    search_fields = ('nama',)
    list_filter = ('id_tempat',)

admin.site.register(Role, RoleAdmin)

class FasilitasAdmin(admin.ModelAdmin):
    list_display = ('id_tempat', 'objek_retribusi', 'rincian', 'keterangan')
    search_fields = ('objek_retribusi', 'rincian', 'keterangan')
    list_filter = ('id_tempat',)

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        if not request.user.is_superuser:
            user_role = request.user.id_role
            form.base_fields['id_tempat'].queryset = Tempat.objects.filter(id=user_role.id_tempat.id)
        return form

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        user_role = request.user.id_role
        return qs.filter(id_tempat=user_role.id_tempat)

admin.site.register(Fasilitas, FasilitasAdmin)

class EventAdmin(admin.ModelAdmin):
    list_display = ('id_tempat', 'nama', 'deskripsi', 'tanggal_mulai', 'tanggal_selesai', 'status')
    search_fields = ('nama', 'deskripsi')
    list_filter = ('id_tempat', 'tanggal_mulai', 'tanggal_selesai', 'status')

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        if not request.user.is_superuser:
            user_role = request.user.id_role
            form.base_fields['id_tempat'].queryset = Tempat.objects.filter(id=user_role.id_tempat.id)
            form.base_fields['status'].disabled = True
        else:
            form.base_fields['status'].disabled = False
        return form

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        user_role = request.user.id_role
        return qs.filter(id_tempat=user_role.id_tempat)

    def save_model(self, request, obj, form, change):
        if not request.user.is_superuser:
            obj.status = 'diproses'
        super().save_model(request, obj, form, change)

admin.site.register(Event, EventAdmin)
