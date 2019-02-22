import { Component, OnInit, Inject } from '@angular/core';
import { Master } from '../../admin/master/master';
import { Observable } from 'rxjs';
import { MasterModelService } from '../../admin/master/master-model.service';
import { Category } from '../../admin/master/categories/api/category';
import { Stock } from '../../stock/api/stock';
import { StockModelService } from '../../stock/stock-model.service';
import { Pos } from '../pos';
import { ApiPosService } from '../api/api.service';
import { finalize } from 'rxjs/operators';
import { PosModelService } from '../pos-model.service';
import { OrderItemsModelService } from '../cart/order-item-model.service';
import { OrderItems } from '../cart/order_items';
import { OrderModelService } from '../../orders/order-model.service';
import { Orders } from '../../orders/orders';
import { CurrentUser } from '../../common/auth/current-user';
import { Business } from '../../business/api/business';
import { Bootstrapper } from '../../stock/bootstrapper.service';
import { BootstrapperPos } from '../bootstrapper.service';
import { StockModel } from '../../stock/stock-model';
import { MatBottomSheet, MatBottomSheetRef, MAT_BOTTOM_SHEET_DATA } from '@angular/material';
import { SetUpModelService } from '../../setup/setup-model.service';
import { CustomerType } from '../../setup/customerType/api/CustomerType';
import { SetUp } from '../../setup/setup';
@Component({
  selector: 'bottom-sheet-of-stock',
  templateUrl: 'bottom-sheet-of-stock.componet.html',
  styleUrls: ['sale-point.component.scss'],
})
export class BottomSheetOverviewStock {
stocks:any[]=[];
stock_name:string='';
centered = false;
  disabled = false;
  unbounded = false;

  radius: number;
  color: string;
  constructor(private bottomSheetRef: MatBottomSheetRef<BottomSheetOverviewStock>,@Inject(MAT_BOTTOM_SHEET_DATA) public data: any) {
    this.stocks=data['stock_movemts'].filter(d=>!d['is_expired']);
    this.stock_name=data['stock_name'];
  }
  applyFilter(filterValue: string) {
    this.stocks.filter(s=>s.total_qty===filterValue.trim().toLowerCase() || s.out_qty===filterValue.trim().toLowerCase() || s.in_qty===filterValue.trim().toLowerCase() || s.batch_no===filterValue.trim().toLowerCase() || s.expired_date===filterValue.trim().toLowerCase());
  }

  openLink(data,event: MouseEvent): void {
    this.bottomSheetRef.dismiss(data);
    event.preventDefault();
  }
}
@Component({
  selector: 'app-sale-point',
  templateUrl: './sale-point.component.html',
  styleUrls: ['./sale-point.component.scss']
})
export class SalePointComponent implements OnInit {
  master$: Observable<Master>;
  categories: Category[] = [];
  currently_stocks: Stock[] = [];
  stocks$: Observable<StockModel>;
  pos$: Observable<Pos>;
  is_order_currently = false;
  current_order = null; //TODO: why this has no type?
  ordered_items = [];
  order$: Observable<Orders[]>;
  order_items$: Observable<OrderItems[]>;
  setup$: Observable<SetUp>;

  business: Business;
  centered = false;
  disabled = false;
  unbounded = false;

  radius: number;
  color: string;
  constructor(private setupModelService:SetUpModelService,private bottomSheet: MatBottomSheet,private bootstrapper_pos: BootstrapperPos,private bootstrapper_stock: Bootstrapper,private currentUser: CurrentUser, private orderItemModelService: OrderItemsModelService, private orderModelService: OrderModelService, private api: ApiPosService, private posModelService: PosModelService, private modelService: StockModelService, private msterModelService: MasterModelService) {
    //this.init_stock();
    this.init_pos();
   }
  //  init_stock() {
  //   return this.bootstrapper_stock.bootstrap();
  //   }
    init_pos() {
      return this.bootstrapper_pos.bootstrap();
      }
  category_selected: Category;
  is_categry_clicked = false;
  customer_type:CustomerType=null;

  ngOnInit() {
    if (this.currentUser.user) {
      this.business = this.currentUser.user[0]; // ?
    }
//modelSetUpService
    this.master$ = this.msterModelService.master$;
    this.pos$ = this.posModelService.pos$;
    this.order_items$ = this.orderItemModelService.order_items$;
    this.setup$ = this.setupModelService.setup$;
    this.checkingCustomerTypeExist();
    this.getDefaultCustomerPrice();
    this.getCurrentOrder();
    this.getCategories();

  }
checkingCustomerTypeExist(){
  if (!this.pos$) return;
  this.pos$.subscribe(res => {
    if (res) {
        if(res.customer_type_price===null){
          this.updatePosSetPrice();
        }
    }
  });
}
updatePosSetPrice(){
  this.setup$.subscribe(res => {
    if (res) {
      // this.customer_type = res.customertypes?res.customertypes.find(p=>p.is_active==0):null;
    if(res.customertypes.find(p=>p.is_active==0)){
        const pos= this.posModelService.get();
          pos.customer_type_price=res.customertypes.find(p=>p.is_active==0);
          this.posModelService.update(pos);
      }

    }
  });
}
  getCategories() {
    if (!this.pos$) return;
    this.pos$.subscribe(res => {
      if (res) {
        this.categories = this.getRows(this.updateSalesPrices(res.stocks));
      }
    });
  }

getDefaultCustomerPrice(){
  if (!this.pos$) return;
      this.pos$.subscribe(res => {
        if (res) {
          this.customer_type =res.customer_type_price || null;
        }
      });
}
updateSalesPrices(stocks:Array<Stock>){
const updated:Stock[]=[];
if(stocks.length > 0){
  stocks.forEach(el=>{
    if(el.customer_type_items.length > 0){
        const prices=el.customer_type_items.find(p=>p['customer_type_id']==this.customer_type.customer_type_id);
           el.item.unit_sale=prices.sale_price_including_tax;

          if (el) {
            updated.push(el);
          }

    }else{
      if (el) {
        updated.push(el);
     }
    }

  });
  return updated;
}else{

  return updated;
}
}

  removeDups(names) {
    let unique = {};
    names.forEach(function (i) {
      if (!unique[i]) {
        unique[i] = true;
      }
    });
    return Object.keys(unique);
  }
  getRows(data: Array<any>) {
    //console.log(data);
    let cat: Category[] = [];
    if (!data) {
      return [];
    } else {
      data.forEach(stock => {
        if (stock['category']) {
          cat.push(stock['category']);
        }
      });
      let obj = {};
      cat = Object.keys(cat.reduce((prev, next) => {
        if (!obj[next.id]) obj[next.id] = next;
        return obj;
      }, obj)).map((i) => obj[i]);
      return cat;
    };
  }
  //TODO:Ithink this function is not useful check with Ganza
  pushCat(cat) {
    const cats = [];
    if (cat.length > 0) {
      for (let i = 0; i < cat.length; i++) {
        if (!cats.includes(cat[i])) {
          cats.push(cat[i]);
        }
      }
    }
    return cats;

  }
  updatePosLayout(panel = 'home') {
    this.posModelService.update({ panel_content: panel });
  }
  homeDir() {
    this.is_categry_clicked = false
    this.updatePosLayout('home');
  }

  getCurrentOrder() {
    if (!this.pos$) return;
    this.current_order=null;
    this.pos$.subscribe(res => {
      if (res) {
        if(res.currently_ordered){
          this.current_order = res.currently_ordered;
        }
      }
    });
  }


  openBottomSheet(stock_movemts,stock_name): any {
    return this.bottomSheet.open(BottomSheetOverviewStock,{
        data:{stock_movemts:stock_movemts,stock_name:stock_name}
    });
  }

  addItemToCart(stock: Stock) {
    if(stock['stockMovmentsTransformable'].length > 1){
        this.openBottomSheet(stock['stockMovmentsTransformable'],stock.item.item).afterDismissed().subscribe(cart_data => {
          this.saveToCartWithOrder(cart_data,stock);
        });
    }else{
      this.saveToCartWithOrder(stock['stockMovmentsTransformable'][0],stock);
    }


  }
saveToCartWithOrder(cart,stock:Stock){
      if (!this.business) return;
    this.getCurrentOrder();

    if (this.is_categry_clicked) {

      if (cart.total_qty === 0) {
        alert("Stock Quantity is unavailable");
      } else {
    const sale_price=stock.customer_type_items.find(p=>p.customer_type_id==this.customer_type.customer_type_id);

        const cart_data: OrderItems = {
          batch_no:cart.batch_no,
          note: null,
          reason_id: null,
          discount_value:this.customer_type?this.customer_type.discount_value:0.00,
          tax_rate_id: stock?stock.tax_rate.id:null,
          sale_price_id: sale_price?sale_price.id:null,
          order_id: this.current_order?this.current_order.id:null,
          stock_id: stock?stock.stock_id:null,
          discount_reason_id: null,
          refund_reason_id:null,
          qty: 1,
          action:'add'
        };

        if (this.current_order) {
          this.updateOrderItem(cart_data);
        } else {
        this.createNewOrder({ status: 'ordered', branch_id: parseInt(localStorage.getItem('active_branch')), user_id: this.currentUser.get('id'), business_id: this.currentUser.get('business')[0].id, cart_data: cart_data });
        }
      }
  }
}

  updateOrderItem(params) {
    this.posModelService.update(this.posModelService.get().loading=true);

    this.api.updateOrderItem(params).pipe(finalize(() =>
    this.posModelService.update(this.posModelService.get().loading=false))).subscribe(
      res => {
      const order_item=res['order_item'] as OrderItems || null ;

        if(order_item){
          const ordered_items:OrderItems[]=this.orderItemModelService.get();

              if(ordered_items && ordered_items.length > 0){

                    ordered_items.forEach((item, i)=> {

                          if (item.id===order_item.id){
                               ordered_items[i] = order_item;
                          }else{
                            if (!ordered_items.includes(order_item)) {
                                    ordered_items.unshift(order_item);
                            }
                          }
                    });

              }else{
                ordered_items.unshift(order_item);
              }
              let _ordered_items: OrderItems[] = this.removeDuplicate(ordered_items,'id');
              this.orderItemModelService.update(_ordered_items,"all");

            }

      },
      _error => {
        console.error(_error);
      }
    );
  }

  removeDuplicate(ordered_items:OrderItems[]= [],id){
    let obj = {};
    let _ordered_items: OrderItems[] = [];
    _ordered_items = Object.keys(ordered_items.reduce((prev, next) => {
      if (!obj[next[id]]) obj[next[id]] = next;
      return obj;
    }, obj)).map((i) => obj[i]);
    return _ordered_items;
  }
  createNewOrder(params) {
    this.posModelService.update({ loading: true });
    this.api.createOrder(params).pipe(finalize(() => this.posModelService.update({ loading: false }))).subscribe(
      res => {
        if(res['order']){

            const order: Orders = res['order'] as Orders;
            const pos=this.posModelService.get();

            pos.currently_ordered=order;
            pos.loading=false;
            pos.orders.unshift(res['order']);

            if(order && order.customer){
              pos.choose_customer=order.customer;
              pos.customer_type_price=order.customer.customer_type;
            }else{
              pos.choose_customer=null;
              pos.customer_type_price=null;
            }

            this.posModelService.update(pos);
              if(pos){
                this.orderItemModelService.update(order['order_items'], 'all');
              }


          }
      },
      _error => {
        console.error(_error);
      }
    );
  }

  // getRandomColor() {
  //   var letters = '0123456789ABCDEF';
  //   var color = '#';
  //   for (var i = 0; i < 6; i++) {
  //     color += letters[Math.floor(Math.random() * 16)];
  //   }
  //   return color == '#ffffff' || color == '#303f9f' ? this.getRandomColor() : color;
  // }
  //[style.color]="'#ffff'" [style.background-color]="getRandomColor()"
  categoriesClicked(category) {
    this.category_selected = category;
    this.is_categry_clicked = true;
    if (this.is_categry_clicked) {
      this.pos$.subscribe(res => {
        if (res.stocks) {
          this.currently_stocks = this.updateSalesPrices(res.stocks).filter(stock => stock['category']['id'] === this.category_selected.id);
        }

      });
    }
  }
}




