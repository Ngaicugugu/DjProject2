from rest_framework import generics
from .models import Books
from .serializer import BooksSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class ProductList(generics.ListAPIView):
    queryset = Books.objects.all()
    serializer_class = BooksSerializer
    
class ProductDetail(APIView):
    def get(self, request, pk):
        try:
            product = Books.objects.get(pk=pk)
            serializer = BooksSerializer(product)
            return Response(serializer.data)
        except Books.DoesNotExist:
            return Response({'error': 'Sản phẩm không tồn tại'}, status=status.HTTP_404_NOT_FOUND)