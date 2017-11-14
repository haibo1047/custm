from django.shortcuts import render,get_object_or_404,get_list_or_404,redirect
from django.template import loader
from django.views import generic
from django.contrib.auth.decorators import login_required

from django.utils import translation
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
    orders = findMyOrders(request.user)
    # output = "|".join([ str(eo.id)+eo.color for eo in orders])
    template = loader.get_template("orders/list.html")
    context = {"order_list":orders}
    return HttpResponse(template.render(context,request))

def test(request):
    return render(request,"base.html")

def home(request):
    # print(translation.get_language_info(translation.get_language()).get("name"))
    print(request.user.is_superuser)
    return render(request,"home.html")

def order1(request):
    context = {}
    if request.method == "GET":
        form = OrderForm(initial={"create_user":request.user,"create_date":timezone.now(),"formula_name":request.user})
        return render(request,"orders/order1.html", {"form":form})

    form = OrderForm(request.POST)
    nextorderpage = form["nextorderpage"].value()
    if nextorderpage == "order4":
        context.update(getPricesInfo())
    print("Next page:", nextorderpage)
    context.update({"form":form})

    return render(request, "orders/"+nextorderpage+".html", context)

@login_required
def saveOrder(request):
    myOrders = findMyOrders(request.user)
    print(len(myOrders))
    if not(request.user.is_superuser) and len(myOrders) >= 1 :
        return errorpage(request,"in current stage, can only book 1 order")
    form = OrderForm(request.POST)
    if not form.is_valid():
        return errorpage(request,form.errors)
    print(form.cleaned_data)
    order = form.save(commit=True)
    return detail(request, order.id)

def findMyOrders(user):
    if user.is_superuser :
        print("orders from super user ")
        myOrders = Order.objects.all().order_by("id")
    else:
        myOrders = Order.objects.filter(create_user = user).order_by("id")
    print(myOrders)
    return myOrders

def errorpage(request, errormsg):
    return render(request, "errorpage.html", {"errormsg":errormsg})

def getPricesInfo():
    priceCtx = {}
    priceCtx["bottle_S"] = Order.SIZE_SETS[1][1]
    priceCtx["bottle_L"] = Order.SIZE_SETS[2][1]
    priceCtx["bottle_0"] = ""
    priceCtx["price_SS"] = "80$"
    priceCtx["price_LL"] = "110$"
    priceCtx["price_SL"] = "90$"
    priceCtx["price_LS"] = "90$"
    priceCtx["price_L0"] = "60$"
    priceCtx["price_0L"] = "60$"
    return priceCtx

def detail(request, id):
    try:
        order = Order.objects.get(pk=id)
    except  Order.DoesNotExist:
        raise Http404("didn't find the Order")
    context = {"order":order}
    return render(request,"orders/detail.html",context)

def delete(request, id):
    print(id)
    order = Order.objects.get(pk=id).delete()
    return orderlist(request)

def search(request, search):
    orders = get_list_or_404(Order,hair_type = search)
    return render(request,"book/index.html",{"order_list":orders})

