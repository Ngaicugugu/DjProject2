# Generated by Django 4.2.5 on 2023-10-26 07:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='books',
            name='images',
            field=models.CharField(default='', max_length=255),
        ),
    ]
