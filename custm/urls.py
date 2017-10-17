"""custm URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.contrib.auth.views import  login,logout
from django.conf.urls import url, include
from django.contrib import admin
from book import views as bookviews

from registration.backends.simple.views import RegistrationView

# Create a new class that redirects the user to the index page, if successful at logging
class MyRegistrationView(RegistrationView):
    def get_success_url(self,request, user):
        return 'home'

urlpatterns = [
    url(r'^accounts/', include('registration.backends.simple.urls')),
    url(r'^$', bookviews.home, name= 'home'),
    url(r'^orders/order1$', bookviews.order1, name='order1'),
    url(r'^orders/order2$', bookviews.order2, name='order2'),
    url(r'^order/(?P<pk>[0-9]+)/$', bookviews.DetailView.as_view(), name='orderdetail'),
    url(r'^orders/$', bookviews.orderlist, name='orderlist'),
    url(r'^search/(?P<search>.+)/$', bookviews.search, name='search'),
    url(r'^test/$', bookviews.test, name='test'),
    url(r'^admin/', admin.site.urls),
]

