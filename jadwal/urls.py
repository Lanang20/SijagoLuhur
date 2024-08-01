from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('events/', views.event_list, name='event_list'),
    path('', views.landing_page, name='landing_page'),
    path('login/', views.user_login, name='login'),
    path('tempat/<int:tempat_id>/', views.tempat_detail, name='tempat_detail'),
    path('send_email/', views.send_email, name='send_email'),
    path("dashboard/", views.dashboard, name="dashboard"),
    path("tempat/", views.tempat, name="tempat"),
    path("tambah_tempat/", views.tambah_tempat, name="tambah_tempat"),
    path("edit_tempat/<int:tempat_id>/", views.edit_tempat, name="edit_tempat"),
    path('tempat/hapus/<int:id>/', views.hapus_tempat, name='hapus_tempat'),
    path("fasilitas/", views.fasilitas, name="fasilitas"),
    path("tambah_fasilitas/", views.tambah_fasilitas, name="tambah_fasilitas"),
    path("edit_fasilitas/<int:fasilitas_id>/", views.edit_fasilitas, name="edit_fasilitas"),
    path('fasilitas/hapus/<int:id>/', views.hapus_fasilitas, name='hapus_fasilitas'),
    path("event/", views.event, name="event"),
    path("tambah_event/", views.tambah_event, name="tambah_event"),
    path("edit_event/<int:event_id>/", views.edit_event, name="edit_event"),
    path("edit_status/<int:event_id>/", views.edit_status, name="edit_status"),
    path('event/hapus/<int:id>/', views.hapus_event, name='hapus_event'),
    path("role/", views.role, name="role"),
    path("tambah_role/", views.tambah_role, name="tambah_role"),
    path("edit_role/<int:role_id>/", views.edit_role, name="edit_role"),
    path('role/hapus/<int:id>/', views.hapus_role, name='hapus_role'),
    path("user/", views.user, name="user"),
    path("tambah_user/", views.tambah_user, name="tambah_user"),
    path('user/hapus/<int:id>/', views.hapus_user, name='hapus_user'),
    path('logout/', views.logout_view, name='logout'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)