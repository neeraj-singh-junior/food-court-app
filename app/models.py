from django.db import models

#Create your models here.
class cart(models.Model):
    sno = models.IntegerField(primary_key=True)
    prname = models.CharField(max_length=100)
    qty = models.IntegerField()
    price = models.IntegerField()
    pic = models.CharField(max_length=200)
    objects = models.Manager()

    class Meta:
        db_table = "cart"


class payment(models.Model):

    cvv_no = models.CharField(max_length=4)
    card_no = models.CharField(max_length=15)
    name = models.CharField(max_length=30)
    exp_date = models.CharField(max_length=10)
    class Meta:
        db_table = "payment"


class Category(models.Model):
    catid=models.AutoField(primary_key=True)
    catname=models.CharField(max_length=30)
    class Meta:
        db_table= 'category'

class Product(models.Model):
    prid = models.AutoField(primary_key=True)
    prname = models.CharField(max_length=30)
    descp = models.CharField(max_length=100)
    pic= models.FileField(upload_to='media/')
    catid = models.IntegerField()
    qty = models.CharField(max_length=25)
    price = models.CharField(max_length=50)



  #  pro_name = models.CharField(max_length=20)

    class Meta:
        db_table = 'product'

class customer(models.Model):
    uname=models.CharField(max_length=30)
    cid = models.AutoField(primary_key=True)
    addr= models.CharField(max_length=100)
    pincode = models.IntegerField()
    phno = models.IntegerField()
    email = models.CharField(max_length=35)
    pwd  =    models.CharField(max_length=10)
    class Meta:
        db_table = 'customer'


class login(models.Model):
    id=models.AutoField(primary_key=True)
    uname=models.CharField(max_length=30)
    pwd=models.CharField(max_length=10)

    class Meta:
        db_table= 'login'


class contactdb(models.Model):

    uname = models.CharField(max_length=30)
    email = models.CharField(max_length=35)
    pno = models.IntegerField()
    message = models.CharField(max_length=300)
    class Meta:
        db_table = "contact"



class orders(models.Model):
    ordid = models.AutoField(primary_key=True)
    custid= models.IntegerField()
    billamt= models.IntegerField()
    addr= models.CharField(max_length=300)
    phno=models.CharField(max_length=15)
    pincode= models.IntegerField()
    ord_date = models.CharField(max_length=10)

    class Meta:
        db_table = "ordertbl"
