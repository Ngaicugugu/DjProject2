from django.urls import path
from . import views

urlpatterns = [
   path('index', views.ProductList.as_view(),name='index')
]