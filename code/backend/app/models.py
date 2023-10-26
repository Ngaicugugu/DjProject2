from django.db import models

# Create your models here.
class Authorities(models.Model):
    id = models.AutoField(primary_key=True)
    userid = models.ForeignKey("Users", on_delete=models.CASCADE)
    roleld = models.ForeignKey("Roles", on_delete=models.CASCADE)

class Users(models.Model):
    id = models.AutoField(primary_key=True)
    password = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    firstname = models.CharField(max_length=255)
    lastname = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    phone = models.CharField(max_length=255)

class Roles(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)

class Categories(models.Model):
    id = models.AutoField(primary_key=True)
    categoryname = models.CharField(max_length=255)
    level = models.IntegerField()
    parentid = models.ForeignKey("Categories", on_delete=models.CASCADE, null=True, blank=True)

class Orders(models.Model):
    id = models.AutoField(primary_key=True)
    userid = models.ForeignKey("Users", on_delete=models.CASCADE)
    orderdate = models.DateTimeField()
    totalamount = models.DecimalField(max_digits=10, decimal_places=2)

class OrderDetails(models.Model):
    id = models.AutoField(primary_key=True)
    orderid = models.ForeignKey("Orders", on_delete=models.CASCADE)
    bookid = models.ForeignKey("Books", on_delete=models.CASCADE)
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)

class Books(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255)
    images = models.CharField(max_length=255, default="")
    Description = models.CharField(max_length=255)

class Cat(models.Model):
    id = models.AutoField(primary_key=True)
    categoryid = models.ForeignKey("Categories",on_delete=models.CASCADE)
    bookid = models.ForeignKey("Books",on_delete=models.CASCADE)