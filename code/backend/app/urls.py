from django.urls import path
from . import views

urlpatterns = [
   path('index', views.ProductList.as_view(),name='index'),
   path('details/<int:pk>/', views.ProductDetail.as_view(), name='product_detail'),
]