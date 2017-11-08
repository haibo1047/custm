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
    orders = Order.objects.filter(create_date__lte=timezone.now()).order_by("id")
    # output = "|".join([ str(eo.id)+eo.color for eo in orders])
    template = loader.get_template("orders/list.html")
    context = {"order_list":orders}
    return HttpResponse(template.render(context,request))

def test(request):
    return render(request,"base.html")

def home(request):
    # print(translation.get_language_info(translation.get_language()).get("name"))
    return render(request,"home.html")

def order1(request):
    context = {}
    print(request.user)
    if request.method == "GET":
        form = OrderForm(initial={"create_user":request.user,"create_date":timezone.now(),"formula_name":request.user})
        return render(request,"orders/order1.html", {"form":form})

    form = OrderForm(request.POST)
    if form.is_valid() :
        print(form.cleaned_data)
        order = form.save(commit=True)
        return detail(request,order.id)
        # return redirect("home")
    nextorderpage = form["nextorderpage"].value()
    if nextorderpage == "order4":
        context.update(getPricesInfo())
    print("Next page:", nextorderpage)
    context.update({"form":form})

    return render(request, "orders/"+nextorderpage+".html", context)

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

def search(request, search):
    orders = get_list_or_404(Order,hair_type = search)
    return render(request,"book/index.html",{"order_list":orders})

