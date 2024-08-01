from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.

class Tempat(models.Model):
    nama = models.CharField(max_length=255)
    deskripsi = models.TextField()
    foto = models.ImageField(upload_to='foto_tempat/', null=True, blank=True)

    def __str__(self):
        return self.nama

class Role(models.Model):
    nama = models.CharField(max_length=255)
    id_tempat = models.ForeignKey(Tempat, on_delete=models.CASCADE)

    def __str__(self):
        return self.nama

class User(AbstractUser):
    id_role = models.ForeignKey(Role, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.username

class Fasilitas(models.Model):
    id_tempat = models.ForeignKey(Tempat, on_delete=models.CASCADE)
    objek_retribusi = models.CharField(max_length=255)
    rincian = models.TextField()
    keterangan = models.TextField()

    def __str__(self):
        return self.objek_retribusi

class Event(models.Model):
    STATUS_CHOICES = [
        ('disetujui', 'Disetujui'),
        ('diproses', 'Diproses'),
        ('ditolak', 'Ditolak'),
    ]

    id_tempat = models.ForeignKey(Tempat, on_delete=models.CASCADE)
    nama = models.CharField(max_length=255)
    tanggal_mulai = models.DateTimeField()
    tanggal_selesai = models.DateTimeField()
    deskripsi = models.TextField()
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='diproses')

    def __str__(self):
        return self.nama