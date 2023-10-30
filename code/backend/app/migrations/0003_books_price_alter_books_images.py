# Generated by Django 4.2.6 on 2023-10-30 02:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_books_images'),
    ]

    operations = [
        migrations.AddField(
            model_name='books',
            name='price',
            field=models.DecimalField(decimal_places=2, default='0', max_digits=10),
        ),
        migrations.AlterField(
            model_name='books',
            name='images',
            field=models.CharField(default='', max_length=500),
        ),
    ]