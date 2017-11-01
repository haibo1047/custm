from django import forms
from .models import  Order

class OrderForm(forms.ModelForm):
    # create_user = forms.CharField(widget=forms.HiddenInput)
    # hair_type = forms.IntegerField(widget=forms.HiddenInput)
    # hair_structure = forms.IntegerField(widget=forms.HiddenInput)
    # scalp_moisture = forms.IntegerField(widget=forms.HiddenInput)
    # hair_goals = forms.CharField(widget=forms.HiddenInput)

    nextorderpage = forms.CharField(widget=forms.HiddenInput)

    class Meta:
        model = Order
        fields = [
            "create_user", "create_date",
            "hair_type", "hair_structure", "scalp_moisture",
            "goals",
            "shampoo_color","conditioner_color","fragrance","fragrance_strength","formula_name",
            "shampoo_size","conditioner_size"
        ]
        widgets = {
            'create_user': forms.HiddenInput(),
            'create_date': forms.HiddenInput(),
            'hair_type': forms.HiddenInput(),
            'hair_structure': forms.HiddenInput(),
            'scalp_moisture': forms.HiddenInput(),
            'goals': forms.HiddenInput(),
            'shampoo_color': forms.HiddenInput(),
            'conditioner_color': forms.HiddenInput(),
            'fragrance': forms.HiddenInput(),
            'fragrance_strength': forms.HiddenInput(),
            'shampoo_size': forms.HiddenInput(),
            'conditioner_size': forms.HiddenInput(),
        }
