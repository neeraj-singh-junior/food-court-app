from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('index', views.index),
    path('adduser', views.adduser,) ,
    path('about', views.about) ,
    path('bill', views.bill) ,
    path('contact', views.contact) ,
    path('ordersdb', views.ordersdb) ,
    path('contactrec', views.contactrec) ,
    path('products', views.products) ,
    path('signup', views.signup) ,
    path('loginsearch', views.loginsearch) ,
    path('loginrd', views.loginrd) ,
    path('administ',views.administ),
    path('Admin_header',views.Admin_header) ,
    path('Sidebar_admin_panel',views.Sidebar_admin_panel) ,
    path('cat',views.list) ,
    path('insertcat',views.insertcat) ,
    path('deletecat/<int:id>', views.deletecat),
    path('pro',views.prolist),
    path('insertpro',views.insertpro),
    path('deletepro/<int:id>', views.deletepro),
    path('customer',views.customerlist),
    path('insertcustomer',views.insertcustomer),
    path('deletecustomer/<int:id>', views.deletecustomer),
    path('deletecart/<int:id>', views.deletecart),
    path('checkout', views.checkout),
    path('searchuser', views.searchuser),
    path('logout', views.logout),
    path('adminorder',views.adminorder),
    path('exportcsv', views.exportcsv),
]



