from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import HttpResponse
from app import views
from config import settings
from django.db.models import Sum
from django.shortcuts import render
from app.models import customer, payment , Category , Product,login,cart,contactdb,orders
import datetime
import csv

def checkout(request):
    b = cart.objects.count()
    vc = cart.objects.all()
    v1 = cart.objects.aggregate(Sum('price'))
    try:
        if b > 2:
            return render(request,'checkout.html',{'vc':vc,'su':v1,'msg':"Not more than 3 items", 'unm': request.session["loginuser"]})
        else:
            ch = cart()
            if request.method == 'POST':
                ch.sno = request.POST.get('sno')
                ch.prname=request.POST.get('prname')
                ch.qty=request.POST.get('qty')
                ch.price=request.POST.get('price')
                ch.pic=request.POST.get('pic')


                ch.save()

                vc = cart.objects.all()
                v1 = cart.object.aggregate(Sum('price'))

                try:
                    if not request.session["loginuser"]:
                        return render(request, "checkout.html", {'vc': vc,'su':v1, 'unm': request.session["loginuser"]})
                    else:
                        return render(request, "checkout.html", {'vc': vc,'su':v1, 'unm': request.session["loginuser"]})
                except:
                    pass
    except:
        return render(request,'checkout.html',{'vc':vc,'su':v1})

    return render(request, 'checkout.html', {'vc': vc, 'su': v1})


def about(request):
    ca = Category.objects.all()
    return render(request, 'about.html', {'ca': ca})


def bill(request):

    return render(request,'bill.html')


def contactrec(request):
    ca = Category.objects.all()

    if request.method == 'POST':
        post = contactdb()
        post.uname = request.POST.get('uname')
        post.email = request.POST.get('email')
        post.pno = request.POST.get('phno')
        post.message = request.POST.get('msg')
        post.save()
        return render(request, 'contact.html', {'ca': ca})


def ordersdb(request):
   try:
            ct = cart.objects.all()
            v1 = cart.objects.aggregate(Sum('price'))

            od = orders()
            od.ordid = request.POST.get('ordid')
            od.custid = request.POST.get('custid')
            od.addr = request.POST.get('addr')
            od.phno = request.POST.get('phno')
            od.pincode = request.POST.get('pincode')
            od.billamt =  v1['price__sum']
            od.ord_date = str(datetime.date.today())
            od.save()
            return render(request, "bill.html",{'su':v1,'ct':ct,'v1':v1,'unm': request.session["loginuser"]})
   except:
        ca = Category.objects.all()
        return render(request, 'login.html', {'ca': ca})


def contact(request):
    return render(request, 'contact.html')


def index(request):
    ca = Category.objects.all()
    try:
        if not request.session["loginuser"]:
            return render(request, "index.html", {'ca': ca})
        else:
            return render(request, "index.html", {'ca': ca, 'unm': request.session["loginuser"]})
    except:
        pass
    return render(request, "index.html", {'ca': ca})


def loginrd(request):
    ca = Category.objects.all()
    return render(request, 'login.html', {'ca': ca})


def loginsearch(request):
    if request.method=="POST":
        e = login.objects.filter(uname=request.POST.get("uname"))
    if not e:
        return render(request, 'index.html')

    return render(request, 'products.html')


def products(request):
    cat = Category.objects.all()
    if (request.POST.get('catid') and request.method == "POST"):
        p = Product.objects.filter(catid=request.POST.get("catid"))
      
        return render(request, "products.html", {'pic': p, 'ca': cat})
    else:

        return render(request, "products.html", {'ca': cat})


def signup(request):
    ca = Category.objects.all()
    return render(request,'signup.html',{'ca': ca})


def administ(request):
    return render(request,"admin/Iframe_admin.html")


def Admin_header(request):
    return render(request,"admin/Admin_header.html")


def Sidebar_admin_panel(request):
    return render(request,"admin/Sidebar_admin_panel.html")


def adduser(request):
    if request.method == 'POST':
            c = customer()
            L = login()

            c.cid = request.POST.get('cid')
            c.uname=request.POST.get('uname')
            c.addr=request.POST.get('addr')
            c.pincode=request.POST.get('pincode')
            c.phno=request.POST.get('phno')
            c.email = request.POST.get('email')
            c.pwd = request.POST.get('pwd')
            c.save()
            L.uname=request.POST.get('uname')
            L.pwd = request.POST.get('pwd')

            L.save()
            return render(request, 'index.html')


def payment(request):
    if request.method == 'POST':
        if request.POST.get('cvvno') and request.POST.get('cardno') and request.POST.get('name'):
            post = payment()
            post.cvvno = request.POST.get('cvvno')
            post.cardno = request.POST.get('cardno')
            post.name = request.POST.get('name')
            post.expirydate = request.POST.get('expirydate')
            post.save()

            return render(request, 'checkout.html')


def insertcat(request):
    if request.method == 'POST':
        if request.POST.get('catname'):
            p = Category()
            p.catid = request.POST.get('catid')
            p.catname = request.POST.get('catname')

            p.save()

            ca = Category.objects.all()

            return render(request, 'admin/cat.html', {'ca': ca})


def list(request):
    cat = Category.objects.all()
    return render(request,"admin/cat.html",{'ca':cat})


def deletecat(request,id):
    c = Category.objects.get(catid=id)
    c.delete()
    c=Category.objects.all()
    return render(request,"admin/cat.html",{'ca': c})


def deletecart(request,id):
    c = cart.objects.get(sno=id)
    c.delete()
    c = cart.objects.all()
    return render(request, "checkout.html", {'vc': c})


def insertpro(request):
    if request.method == 'POST':
        if request.POST.get('prname') and request.FILES['file']:
            p = Product(request.POST, request.FILES)
            p.prid = request.POST.get('prid')
            p.prname = request.POST.get('prname')
            p.descp = request.POST.get('descp')
            p.qty = request.POST.get('qty')
            p.price = request.POST.get('price')
            p.catid = request.POST.get('catid')
            docfile = request.FILES['file']
            p.pic = docfile

            p.save()
            pa = Product.objects.all()
            return render(request, 'admin/pro.html', {'pa': pa})


def prolist(request):
    pro = Product.objects.all()
    ca = Category.objects.all()
    return render(request,"admin/pro.html",{'pa':pro,'ca':ca})


def deletepro(request,id):
    p = Product.objects.get(prid=id)
    p.delete()
    p=Product.objects.all()
    return render(request,"admin/pro.html",{'pa': p})


def insertcustomer(request):
    if request.method == 'POST':
        if request.POST.get('uname') and request.POST.get('cid'):
            p = customer()
            p.uname = request.POST.get('uname')
            p.cid = request.POST.get('cid')
            p.addr = request.POST.get('addr')
            p.pincode = request.POST.get('pincode')
            p.phno = request.POST.get('phno')
            p.email = request.POST.get('email')
            p.pwd = request.POST.get('pwd')

            p.save()
            us = customer.objects.all()
            return render(request, 'admin/customer.html', {'us': us})


def customerlist(request):
    u = customer.objects.all()
    return render(request,"admin/customer.html",{'us':u})


def deletecustomer(request,id):
    u = customer.objects.get(cid= id)
    u.delete()
    u = customer.objects.all()
    return render(request,"admin/customer.html",{'us': u})


def searchuser(request):
    try:
        su = login.objects.all()
        ca= Category.objects.all()
        pw = request.POST.get('pwd')
        if request.method=='POST':
            for m in su:
                if m.pwd == pw :
                    request.session["loginuser"] = m.uname
            return render(request,"index.html", {'ca':ca,'unm':request.session["loginuser"] })
    except:
        return render(request, "index.html", {'ca': ca})


def logout(request):
    del request.session['loginuser']
    request.session.modified = True
    cr = cart.objects.all()
    for c in cr[1:]:
        c.delete()
    return render(request,"index.html")


def adminorder(request):
    od = orders.objects.all()
    return render(request, "admin/orders.html",{'od':od})


def exportcsv(request):
    od = orders.objects.all()
    f = open("order.csv", "w", newline='')
    w = csv.writer(f)
    L =['Order ID','Customer ID','Bill Amount','Address','Phone Number','PinCode','Order Date']
    w.writerow(L)
    for c in od:
        d = [c.ordid,c.custid,c.billamt,c.addr,c.phno,c.pincode,c.ord_date]
        w.writerow(d)
    f.close()
    return render(request, "admin/orders.html",{'od':od})
