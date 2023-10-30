from rest_framework import generics
from .models import Books
from .serializer import BooksSerializer

class ProductList(generics.ListAPIView):
    queryset = Books.objects.all()
    serializer_class = BooksSerializer