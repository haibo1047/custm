from django.shortcuts import render,get_object_or_404,get_list_or_404,redirect
from django.template import loader
from django.views import generic
from django.contrib.auth.decorators import login_required

# Create your views here.

from django.http import HttpResponse
from django.http import Http404
from .models import Order
from django.utils import timezone
from .forms import OrderForm
from django.contrib.auth.models import User
from .utils import *

# class DetailView(generic.DetailView):
#     model = Order
#     template_name = "orders/detail.html"

@login_required
def orderlist(request):
    orders = Order.objects.filter(create_date__lte=timezone.now()).order_by("id")
    # output = "|".join([ str(eo.id)+eo.color for eo in orders])
    template = loader.get_template("orders/list.html")
    context = {"order_list":orders}
    return HttpResponse(template.render(context,request))

def test(request):
    return render(request,"base.html")

def home(request):

    return render(request,"home.html")

def order1(request):
    if request.method == "GET":
        form = OrderForm(initial={"create_user":User.objects.first(),"create_date":timezone.now(),"formula_name":User.objects.first()})
        return render(request,"orders/order1.html", {"form":form})

    form = OrderForm(request.POST)
    if form.is_valid() :
        print(form.cleaned_data)
        order = form.save(commit=True)
        return detail(request,order.id)
        # return redirect("home")
    nextorderpage = form["nextorderpage"].value()
    print("Next page:", nextorderpage)

    return render(request, "orders/"+nextorderpage+".html", {"form":form})

def detail(request, id):
    try:
        order = Order.objects.get(pk=id)
    except  Order.DoesNotExist:
        raise Http404("didn't find the Order")
    context = {"order":order}
    return render(request,"orders/detail.html",context)

def search(request, search):
    orders = get_list_or_404(Order,hair_type = search)
    return render(request,"book/index.html",{"order_list":orders})

