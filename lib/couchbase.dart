import 'dart:async';

import 'package:flipper/data/main_database.dart';
import 'package:flipper/domain/redux/app_actions/actions.dart';
import 'package:flipper/domain/redux/app_state.dart';
import 'package:flipper/model/branch.dart';
import 'package:flipper/model/business.dart';
import 'package:flipper/model/product.dart';
import 'package:flipper/model/tax.dart';
import 'package:flutter/services.dart';
import 'package:fluttercouch/fluttercouch.dart';
import 'package:redux/redux.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uuid/uuid.dart';

import 'model/user.dart';

class CouchBase extends Model with Fluttercouch {
  CouchBase({bool shouldInitDb}) {
    if (shouldInitDb) {
      initPlatformState();
    }
  }

  String databaseName;
  Document docExample;
  final MutableDocument _doc = MutableDocument();
  Query query;
 
  

  //create a branch
  Future<dynamic> createBranch(Map map) async {
    assert(map['_id'] != null);
    assert(map['name'] != null);
    assert(map['channel'] != null);
    assert(map['active'] != null);
    assert(map['businessId'] != null);
    assert(map['mapLatitude'] != null);
    assert(map['mapLongitude'] != null);
    assert(map['id'] != null);
    assert(map['updatedAt'] != null);
    assert(map['createdAt'] != null);
    assert(map['_id'] != null);

    final Document doc = await getDocumentWithId(map['_id']);

    // ignore: always_specify_types
    final List<Map> m = [map];

    doc.toMutable().setList('branches', m).setString('uid', Uuid().v1());
    // .setList('channels', [map['channel']]).setString('_id', map['_id']);
    return await saveDocumentWithId(map['_id'], doc);
  }

  // ignore: always_specify_types
  Future<dynamic> createTax(map) async {
    assert(map != null);
    final Document doc = await getDocumentWithId(map['_id']);

    assert(map['channel'] != null);
    assert(map['name'] != null);
    assert(map['active'] != null);
    assert(map['isDefault'] != null);
    assert(map['id'] != null);
    assert(map['createdAt'] != null);
    assert(map['updatedAt'] != null);
    assert(map['businessId'] != null);

    // ignore: always_specify_types
    final List m = [map];
    doc.toMutable().setList('taxes', m).setString('uid', Uuid().v1());
    // .setList('channels', [map['channel']]).setString('_id', map['_id']);

    return await saveDocumentWithId(map['_id'], doc);
  }

  //create business.
  // ignore: always_specify_types
  Future<dynamic> createBusiness(Map map) async {
    //if user has business do nothing
    final Document doc = await getDocumentWithId(map['_id']);

    assert(map['_id'] != null);

    assert(map['channel'] != null);
    assert(map['name'] != null);
    assert(map['active'] != null);
    assert(map['categoryId'] != null);
    assert(map['typeId'] != null);
    assert(map['businessUrl'] != null);
    assert(map['country'] != null);
    assert(map['currency'] != null);
    assert(map['id'] != null);
    assert(map['timeZone'] != null);
    assert(map['createdAt'] != null);
    assert(map['updatedAt'] != null);
    assert(map['userId'] != null);

    // ignore: always_specify_types
    final List m = [map];
    doc
        .toMutable()
        .setList('businesses', m)
        // .setList('channels', [map['channel']])
        .setString('uid', Uuid().v1())
        .setString('_id', map['_id']);

    return await saveDocumentWithId(map['_id'], doc);
  }

  //create user
  Future<dynamic> createUser(Map map) async {
    assert(map['_id'] != null);

    assert(map['name'] != null);
    assert(map['channel'] != null);
    assert(map['token'] != null);
    assert(map['id'] != null);
    assert(map['active'] != null);
    assert(map['email'] != null);
    assert(map['channel'] != null);
    assert(map['createdAt'] != null);
    assert(map['updatedAt'] != null);

    Document doc = await getDocumentWithId(map['_id']);

    if (doc.toMutable().getString('email') != null) {
      MutableDocument mutableDocument = doc.toMutable();
      mutableDocument
          .setString('id', doc.getString('id'))
          .setString('uid', Uuid().v1())
          .setString('_id', map['_id']);

      map.forEach((key, value) {
        if (value is int) {
          mutableDocument.setInt(key, value);
        }
        if (value is String) {
          mutableDocument.setString(key, value);
        }
        if (value is bool) {
          mutableDocument.setBoolean(key, value);
        }
        if (value is double) {
          mutableDocument.setDouble(key, value);
        }
      });
      return await saveDocumentWithId(map['_id'], mutableDocument);
    } else {
      _doc.setString('uid', Uuid().v1()).setString('_id', map['_id']);
      // ignore: always_specify_types
      map.forEach((key, value) {
        if (value is int) {
          _doc.setInt(key, value);
        }
        if (value is String) {
          _doc.setString(key, value);
        }
        if (value is bool) {
          _doc.setBoolean(key, value);
        }
        if (value is double) {
          _doc.setDouble(key, value);
        }
      });
      // _doc.setList('channels', [map['channel']]);
      return await saveDocumentWithId(map['_id'], _doc);
    }
  }

  Future<dynamic> getDocumentByDocId(
      {String docId, Store<AppState> store, T}) async {
    Document doc = await getDocumentWithId(docId);

    switch (T.toString()) {
      case 'User':
        {
          return buildUserModel(doc, store);
        }
        break;

      case 'Business':
        {
          return buildBusinessModel(doc, store);
        }
      case 'Branch':
        {
          return buildBranchModel(doc, store);
        }
      case 'Item':
        {
          return buildProduct(doc, store);
        }
        break;

      default:
        return null;
        break;
    }
  }

  //validation methods (business name will be docId)
  Future<bool> docExist(String docId) async {
    var doc = await getDocumentWithId(docId);
    if (doc == null) {
      return false;
    }
    return true;
  }

  //return stream of branches
  static getBranches(int userId) {}

  addChannelListenTo({Store<AppState> store}) {
    // setChannel(store.state.userId.toString());
  }

  initPlatformState() async {
    try {
      // final storage = new FlutterSecureStorage();
      // String sync_database = await storage.read(key: 'sync_database');
      // String sync_url = await storage.read(key: 'sync_url');
      // String channel = await storage.read(key: 'channel');
      // if (sync_database == null || sync_url == null) return;

      try {
        //prod:
        // await initDatabaseWithName('lagrace');
        //dev:
        await initDatabaseWithName('lagrace_dev');
      } on PlatformException {
        // Handle error during database initialization
      }

      //TODO(richard): enable this sync replication when user has paid.
      // setReplicatorEndpoint('ws://${sync_url}/${sync_database}');
      // setReplicatorType('PUSH_AND_PULL');

      // setReplicatorSessionAuthentication(
      //     'b2dfb02940783371ea48881e9594ae0e0eb472d8');

      // if (channel != null) {
      //   //TODO(richard): set channel on app login, also check if we do load data when no user logged in!
      //   setChannel(channel);
      // }
      // setReplicatorContinuous(true);
      // initReplicator();
      // startReplicator();

      //this is the way of getting notified about db change. adding a live query
      //https://docs.couchbase.com/couchbase-lite/2.5/java.html#live-query

      //channel: https://blog.couchbase.com/exploring-the-public-and-user-channels-in-couchbase-sync-gateway/

      //query.removeChangeListener(token);
      //https://blog.couchbase.com/document-conflicts-couchbase-mobile/
      //TODO(richard): to be tested alongside the desktop app,because when I edit data manually in dashboard it create conflict.
      //TODO(richard): experimenting with live Query.
      // Query query = QueryBuilder.select([SelectResult.all()]).from('lagrace');

      //start of the query:
      // query.execute();
      // ListenerToken token =
      //     await query.addChangeListener((change) => {print(change)});

      // Query b = QueryBuilder.select([SelectResult.all()]).from('lagrace').where(
      //     Expression.property('_id').equalTo(Expression.string('business_1')));

      // ResultSet results = await b.execute();
      // b.addChangeListener((change) => {print(change.results)});

      notifyListeners();
    } on PlatformException {}
  }

  // ignore: always_specify_types
  Future syncRemoteToLocal({Store<AppState> store}) async {
    //load branch products

    await syncBranchProductRLocal(store);

    //load products
    await syncProductRLocal(store);

    //load all app units:
    await syncUnit(store);

    //load taxes:
    await syncTaxesRLocal(store);
    //end loading taxes
    //category
    await syncCategoriesRLocal(store);
    //done loading category

    //sync branch
    await syncBranchRLocal(store);
    //load business.
    await syncBusinessRLocal(store);

    //load variants:
    await syncVariantsRLocal(store);

    //load all stocks:
    await syncStockRLocal(store);

    //load stock history
    await syncHistoryRLocal(store);
  }

  Future syncHistoryRLocal(Store<AppState> store) async {
    Document stockHistories = await getDocumentWithId(
        'stockHistory_' + store.state.userId.toString());
    if (stockHistories.getList('stockHistory') != null) {
      for (var i = 0; i < stockHistories.getList('stockHistory').length; i++) {
        StockHistoryTableData history = await store
            .state.database.stockHistoryDao
            .getById(id: stockHistories.getList('stockHistory')[i]['id']);
        // ignore:missing_required_param
        StockHistoryTableData historyData = StockHistoryTableData(
            id: stockHistories.getList('stockHistory')[i]['id'],
            note: stockHistories.getList('stockHistory')[i]['note'],
            quantity: stockHistories.getList('stockHistory')[i]['quantity'],
            stockId: stockHistories.getList('stockHistory')[i]['stockId'],
            reason: stockHistories.getList('stockHistory')[i]['reason'],
            variantId: stockHistories.getList('stockHistory')[i]['variantId'],
            createdAt: DateTime.parse(
                stockHistories.getList('stockHistory')[i]['createdAt']),
            updatedAt: DateTime.parse(
                stockHistories.getList('stockHistory')[i]['updatedAt']));

        if (history == null) {
          await store.state.database.stockHistoryDao.insert(historyData);
        } else {
          await store.state.database.stockHistoryDao
              .updateHistory(historyData.copyWith(idLocal: history.idLocal));
        }
      }
    }
  }

  // ignore: always_specify_types
  Future syncStockRLocal(Store<AppState> store) async {
    final Document stocks =
        await getDocumentWithId('stocks_' + store.state.userId.toString());
    if (stocks.getList('stocks') != null) {
      for (int i = 0; i < stocks.getList('stocks').length; i++) {
        final StockTableData stock = await store.state.database.stockDao
            .getById(id: stocks.getList('stocks')[i]['id']);
        // ignore:missing_required_param
        final StockTableData branchProductData = StockTableData(
            id: stocks.getList('stocks')[i]['id'],
            supplyPrice: stocks.getList('stocks')[i]['supplyPrice'].toDouble(),
            retailPrice: stocks.getList('stocks')[i]['retailPrice'].toDouble(),
            lowStock: stocks.getList('stocks')[i]['lowStock'],
            action: stocks.getList('stocks')[i]['action'],
            variantId: stocks.getList('stocks')[i]['variantId'],
            branchId: stocks.getList('stocks')[i]['branchId'],
            productId: stocks.getList('stocks')[i]['productId'],
            currentStock: stocks.getList('stocks')[i]['currentStock'],
            canTrackingStock: stocks.getList('stocks')[i]['canTrackingStock'],
            showLowStockAlert: stocks.getList('stocks')[i]['showLowStockAlert'],
            createdAt: DateTime.parse(stocks.getList('stocks')[i]['createdAt']),
            updatedAt:
                DateTime.parse(stocks.getList('stocks')[i]['updatedAt']));

        if (stock == null) {
          await store.state.database.stockDao.insert(branchProductData);
        } else {
          await store.state.database.stockDao.updateStock(
              branchProductData.copyWith(
                  idLocal: stock.idLocal, isActive: false, action: 'NONE'));
        }
      }
    }
  }

  // ignore: always_specify_types
  Future syncVariantsRLocal(Store<AppState> store) async {
    final Document variants =
        await getDocumentWithId('variants_' + store.state.userId.toString());

    if (variants.getList('variants') != null) {
      for (int i = 0; i < variants.getList('variants').length; i++) {
        final VariationTableData variation = await store.state.database.variationDao
            .getVariationById(variantId: variants.getList('variants')[i]['id']);
        // ignore:missing_required_param
        final VariationTableData variationData = VariationTableData(
            name: variants.getList('variants')[i]['name'],
            id: variants.getList('variants')[i]['id'],
            isActive: false,
            sku: variants.getList('variants')[i]['SKU'],
            productId: variants.getList('variants')[i]['productId'],
            unit: variants.getList('variants')[i]['unit'],
            createdAt:
                DateTime.parse(variants.getList('variants')[i]['createdAt']),
            updatedAt:
                DateTime.parse(variants.getList('variants')[i]['updatedAt']));

        if (variation == null) {
          await store.state.database.variationDao.insert(variationData);
        } else {
          await store.state.database.variationDao.updateVariation(
              variationData.copyWith(idLocal: variation.idLocal));
        }
      }
    }
  }

  // ignore: always_specify_types
  Future syncBranchRLocal(Store<AppState> store) async {
    final Document branch =
        await getDocumentWithId('branches_' + store.state.userId.toString());

    if (branch.getList('branches') != null) {
      for (int i = 0; i < branch.getList('branches').length; i++) {
        final BranchTableData brachi = await store.state.database.branchDao
            .getBranchById(branchId: branch.getList('branches')[i]['id']);

        final BranchTableData businessTableData = BranchTableData(
          id: branch.getList('branches')[i]['id'],
          name: branch.getList('branches')[i]['name'],
          isActive: branch.getList('branches')[i]['isActive'] ?? false,
          businessId: branch.getList('branches')[i]['businessId'],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(), idLocal: 1,
        );
        if (brachi == null) {
          await store.state.database.branchDao.insert(businessTableData);
        } else {
          await store.state.database.branchDao.updateBranch(
              businessTableData.copyWith(idLocal: brachi.idLocal));
        }
      }
    }
  }

  // ignore: always_specify_types
  Future syncBusinessRLocal(Store<AppState> store) async {
    final Document business =
        await getDocumentWithId('business_' + store.state.userId.toString());
    if (business.getList('businesses') != null) {
      for (int i = 0; i < business.getList('businesses').length; i++) {
        final BusinessTableData busine = await store.state.database.businessDao
            .getBusinesById(id: business.getList('businesses')[i]['id']);
        // ignore:missing_required_param
        final BusinessTableData businessTableData = BusinessTableData(
            active: business.getList('businesses')[i]['active'],
            name: business.getList('businesses')[i]['name'],
            id: business.getList('businesses')[i]['id'],
            userId: business.getList('businesses')[i]['userId'],
            longitude: business.getList('businesses')[i]['longitude'],
            typeId: business.getList('businesses')[i]['typeId'].toString(),
            categoryId:
                business.getList('businesses')[i]['categoryId'].toString(),
            country: business.getList('businesses')[i]['country'],
            timeZone: business.getList('businesses')[i]['timeZone'],
            currency: business.getList('businesses')[i]['currency'],
            latitude: business.getList('businesses')[i]['latitude'],
            createdAt:
                DateTime.parse(business.getList('businesses')[i]['createdAt']),
            updatedAt:
                DateTime.parse(business.getList('businesses')[i]['updatedAt']));

        if (busine == null) {
          await store.state.database.businessDao.insert(businessTableData);
        } else {
          await store.state.database.businessDao.updateBusiness(
              businessTableData.copyWith(idLocal: busine.idLocal));
        }
      }
    }
  }

  // ignore: always_specify_types
  Future syncCategoriesRLocal(Store<AppState> store) async {
    final Document categories =
        await getDocumentWithId('categories_' + store.state.userId.toString());
    if (categories.getList('categories') != null) {
      for (int i = 0; i < categories.getList('categories').length; i++) {
        final CategoryTableData category = await store.state.database.categoryDao
            .getById(id: categories.getList('categories')[i]['id']);
        CategoryTableData categoryData;
        if (i == 1) {
          // ignore:missing_required_param
          categoryData = CategoryTableData(
              id: categories.getList('categories')[i]['id'],
              name: categories.getList('categories')[i]['name'],
              focused: true,
              branchId: categories.getList('categories')[i]['branchId'],
              createdAt: DateTime.parse(
                  categories.getList('categories')[i]['createdAt']),
              updatedAt: DateTime.parse(
                  categories.getList('categories')[i]['updatedAt']));
        } else {
          // ignore:missing_required_param
          categoryData = CategoryTableData(
              id: categories.getList('categories')[i]['id'],
              name: categories.getList('categories')[i]['name'],
              focused: false,
              branchId: categories.getList('categories')[i]['branchId'],
              createdAt: DateTime.parse(
                  categories.getList('categories')[i]['createdAt']),
              updatedAt: DateTime.parse(
                  categories.getList('categories')[i]['updatedAt']));
        }

        if (category == null) {
          await store.state.database.categoryDao.insert(categoryData);
        } else {
          await store.state.database.categoryDao
              .updateCategory(categoryData.copyWith(idLocal: category.idLocal));
        }
      }
    } else {
      //the remote did not work create it then offline sync them later

      // ignore: flutter_style_todos
      //TODO(richard): remember to sync a custom category created local and tax to remote so other client can have them too.
      if (store.state.branch == null) {
        return;
      }
      final CategoryTableData category =
          await store.state.database.categoryDao.getCategoryByNameBranchId(
        'custom',
        store.state.branch.id,
      );
      if (category == null) {
        //ignore:missing_required_param
        final CategoryTableData categoryData = CategoryTableData(
            id: Uuid().v1(),
            name: 'custom',
            focused: true,
            branchId: store.state.branch.id,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());

        await store.state.database.categoryDao.insert(categoryData);
      }
    }
  }

  // ignore: always_specify_types
  Future syncTaxesRLocal(Store<AppState> store) async {
    final Document taxes =
        await getDocumentWithId('taxes_' + store.state.userId.toString());
    if (taxes.getList('taxes') != null) {
      for (int i = 0; i < taxes.getList('taxes').length; i++) {
        final TaxTableData tax = await store.state.database.taxDao
            .getById(taxid: taxes.getList('taxes')[i]['id']);
        // ignore:missing_required_param
        final TaxTableData taxData = TaxTableData(
            id: taxes.getList('taxes')[i]['id'],
            name: taxes.getList('taxes')[i]['name'],
            businessId: taxes.getList('taxes')[i]['businessId'],
            isDefault: taxes.getList('taxes')[i]['isDefault'],
            percentage: taxes.getList('taxes')[i]['percentage'].toDouble(),
            createdAt: DateTime.parse(taxes.getList('taxes')[i]['createdAt']),
            updatedAt: DateTime.parse(taxes.getList('taxes')[i]['updatedAt']));

        if (tax == null) {
          await store.state.database.taxDao.insert(taxData);
          if (taxes.getList('taxes')[i]['isDefault']) {
            store.dispatch(
              DefaultTax(
                tax: Tax((t) => t
                  ..name = taxData.name
                  ..id = taxData.id
                  ..isDefault = taxData.isDefault
                  ..percentage = taxData.percentage
                  ..businessId = taxData.businessId),
              ),
            );
          }
        } else {
          await store.state.database.taxDao
              .updateTax(taxData.copyWith(idLocal: tax.idLocal));

          if (taxes.getList('taxes')[i]['isDefault']) {
            store.dispatch(
              DefaultTax(
                tax: Tax((t) => t
                  ..name = taxData.name
                  ..id = taxData.id
                  ..isDefault = taxData.isDefault
                  ..percentage = taxData.percentage
                  ..businessId = taxData.businessId),
              ),
            );
          }
        }
      }
    } else {
      //create them local for sync to remote later.
      //ignore:missing_required_param
      if (store.state.currentActiveBusiness == null) {
        return;
      }
      final TaxTableData tax = await store.state.database.taxDao.getByName(
          businessId: store.state.currentActiveBusiness.id, name: 'Vat');
      if (tax == null) {
        //ignore:missing_required_param
        final TaxTableData taxData = TaxTableData(
            id: Uuid().v1(),
            name: 'Vat',
            businessId: store.state.businessId,
            isDefault: true,
            percentage: 18,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());

        //dispatch default tax we are using:
        store.dispatch(
          DefaultTax(
            tax: Tax((TaxBuilder t) => t
              ..name = taxData.name
              ..id = taxData.id
              ..isDefault = taxData.isDefault
              ..percentage = taxData.percentage
              ..businessId = taxData.businessId),
          ),
        );
        await store.state.database.taxDao.insert(taxData);
        //ignore:missing_required_param
        final TaxTableData noVat = TaxTableData(
            id: Uuid().v1(),
            name: 'No Tax',
            businessId: store.state.businessId,
            isDefault: true,
            percentage: 18,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());

        await store.state.database.taxDao.insert(noVat);
      }
    }
  }

  // ignore: always_specify_types
  Future syncUnit(Store<AppState> store) async {
    // ignore: always_specify_types
    final List<Map<String, String>> units = [
      // ignore: always_specify_types
      {'name': 'Per Item', 'value': ''},
      {'name': 'Per Kilogram (kg)', 'value': 'kg'},
      {'name': 'Per Cup (c)', 'value': 'c'},
      {'name': 'Per Liter (l)', 'value': 'l'},
      {'name': 'Per Pound (lb)', 'value': 'lb'},
      {'name': 'Per Pint (pt)', 'value': 'pt'},
      {'name': 'Per Acre (ac)', 'value': 'ac'},
      {'name': 'Per Centimeter (cm)', 'value': 'cm'},
      {'name': 'Per Cubic Footer (cu ft)', 'value': 'cu ft'},
      {'name': 'Per Day (day)', 'value': 'day'},
      {'name': 'Footer (ft)', 'value': 'ft'},
      {'name': 'Per Gram (g)', 'value': 'g'},
      {'name': 'Per Hour (hr)', 'value': 'hr'},
      {'name': 'Per Minute (min)', 'value': 'min'},
      {'name': 'Per Acre (ac)', 'value': 'ac'},
      {'name': 'Per Cubic Inch (cu in)', 'value': 'cu in'},
      {'name': 'Per Cubic Yard (cu yd)', 'value': 'cu yd'},
      {'name': 'Per Fluid Ounce (fl oz)', 'value': 'fl oz'},
      {'name': 'Per Gallon (gal)', 'value': 'gal'},
      {'name': 'Per Inch (in)', 'value': 'in'},
      {'name': 'Per Kilometer (km)', 'value': 'km'},
      {'name': 'Per Meter (m)', 'value': 'm'},
      {'name': 'Per Mile (mi)', 'value': 'mi'},
      {'name': 'Per Milligram (mg)', 'value': 'mg'},
      {'name': 'Per Milliliter (mL)', 'value': 'mL'},
      {'name': 'Per Millimeter (mm)', 'value': 'mm'},
      {'name': 'Per Millisecond (ms)', 'value': 'ms'},
      {'name': 'Per Ounce (oz)', 'value': 'oz'},
      {'name': 'Per  Quart (qt)', 'value': 'qt'},
      {'name': 'Per Second (sec)', 'value': 'sec'},
      {'name': 'Per Shot (sh)', 'value': 'sh'},
      {'name': 'Per Square Centimeter (sq cm)', 'value': 'sq cm'},
      {'name': 'Per Square Foot (sq ft)', 'value': 'sq ft'},
      {'name': 'Per Square Inch (sq in)', 'value': 'sq in'},
      {'name': 'Per Square Kilometer (sq km)', 'value': 'sq km'},
      {'name': 'Per Square Meter (sq m)', 'value': 'sq m'},
      {'name': 'Per Square Mile (sq mi)', 'value': 'sq mi'},
      {'name': 'Per Square Yard (sq yd)', 'value': 'sq yd'},
      {'name': 'Per Stone (st)', 'value': 'st'},
      {'name': 'Per Yard (yd)', 'value': 'yd'}
    ];
    for (int i = 0; i < units.length; i++) {
      //insert or update unit in table set focus to false for all.
      final UnitTableData unit = await store.state.database.unitDao
          .getUnitByName(name: units[i]['name']);

      UnitTableData unitTableData;
      if (units[i]['value'] == 'kg') {
        unitTableData =
            //ignore:missing_required_param
            UnitTableData(
          name: units[i]['name'],
          focused: true,
          value: units[i]['value'],
        );
      } else {
        unitTableData =
            //ignore:missing_required_param
            UnitTableData(
                name: units[i]['name'],
                focused: false,
                value: units[i]['value']);
      }

      if (unit == null) {
        await store.state.database.unitDao.insert(unitTableData);
      } else {
        await store.state.database.unitDao
            .updateUnit(unitTableData.copyWith(id: unit.id));
      }
    }
  }

  // ignore: always_specify_types
  Future syncProductRLocal(Store<AppState> store) async {
    final Document doc =
        await getDocumentWithId('products_' + store.state.userId.toString());
    if (doc.getList('products') != null) {
      for (int i = 0; i < doc.getList('products').length; i++) {
        final ProductTableData product = await store.state.database.productDao
            .getItemById(productId: doc.getList('products')[i]['id']);
        // ignore:missing_required_param
        final ProductTableData productData = ProductTableData(
            businessId: doc.getList('products')[i]['businessId'].toString(),
            active: doc.getList('products')[i]['active'],
            isImageLocal: false,
            name: doc.getList('products')[i]['name'],
            id: doc.getList('products')[i]['id'],
            color: doc.getList('products')[i]['color'],
            description: doc.getList('products')[i]['description'],
            picture: doc.getList('products')[i]['picture'],
            taxId: doc.getList('products')[i]['taxId'],
            hasPicture: doc.getList('products')[i]['hasPicture'],
            isDraft: doc.getList('products')[i]['isDraft'],
            isCurrentUpdate: doc.getList('products')[i]['isCurrentUpdate'],
            supplierId: doc.getList('products')[i]['supplierId'].toString(),
            categoryId: doc.getList('products')[i]['categoryId'].toString(),
            createdAt: DateTime.parse(doc.getList('products')[i]['createdAt']),
            updatedAt: DateTime.parse(doc.getList('products')[i]['updatedAt']));

        if (product == null) {
          await store.state.database.productDao.insert(productData);
        } else {
          await store.state.database.productDao
              .updateProduct(productData.copyWith(idLocal: product.idLocal));
        }
      }
    }
  }

  // ignore: always_specify_types
  Future syncBranchProductRLocal(Store<AppState> store) async {
    final Document branchProducts = await getDocumentWithId(
        'branchProducts_' + store.state.userId.toString());
    if (branchProducts.getList('branchProducts') != null) {
      for (int i = 0;
          i < branchProducts.getList('branchProducts').length;
          i++) {
        final BranchProductTableData branchProduct = await store
            .state.database.branchProductDao
            .getById(id: branchProducts.getList('branchProducts')[i]['id']);
        final BranchProductTableData branchProductData = BranchProductTableData(
          id: branchProducts.getList('branchProducts')[i]['id'],
          branchId: branchProducts.getList('branchProducts')[i]['branchId'],
          productId: branchProducts.getList('branchProducts')[i]['productId'], idLocal: 1,
        );

        if (branchProduct == null) {
          await store.state.database.branchProductDao.insert(branchProductData);
        } else {
          await store.state.database.branchProductDao.updateBP(
              branchProductData.copyWith(idLocal: branchProduct.idLocal));
        }
      }
    }
  }

  //return
  //FIXME: this worked but could not
  Stream<dynamic> getDocumentByQuery(Store<AppState> store) async* {
    final Query query = QueryBuilder.select([SelectResult.all()])
        .from(store.state.couchDbClient.name)
        .where(Expression.property('_id')
            .equalTo(Expression.string('businesses')));

    final ResultSet results = await query.execute();
    // ignore: always_specify_types
    query.addChangeListener((QueryChange change) => {
          // if(change.results != null)
          //   {
          print(change.results)
          //resultsCallback(change.results);
          // }
        });

    yield results.allResults();
  }

  Future<dynamic> queryEmail(Store<AppState> store, String email) async {
    // ResultSet results = await query.execute();
  }

  User buildUserModel(Document doc, Store<AppState> store) {
    return User(
      (UserBuilder u) => u
        ..id = doc.getString('id')
        ..email = doc.getString('email')
        ..name = doc.getString('name')
        ..createdAt = doc.getString('createdAt')
        ..updatedAt = doc.getString('createdAt')
        ..active = doc.getBoolean('active')
        ..token = doc.getString('token'),
    );
  }

  List<Business> buildBusinessModel(Document doc, Store<AppState> store) {
    final List<Business> business = [];
    const String business_ = 'businesses';

    if (doc.getList(business_) == null) {
      return business;
    }

    for (int i = 0; i < doc.getList(business_).length; i++) {
      business.add(Business((b) => b
        ..name = doc.getList(business_)[i]['name']
        ..id = doc.getList(business_)[i]['id']
        ..currency = doc.getList(business_)[i]['currency']
        ..categoryId = doc.getList(business_)[i]['categoryId'].toString()
        ..country = doc.getList(business_)[i]['country']
        ..userId = doc.getList(business_)[i]['userId'].toString()
        ..active = doc.getList(business_)[i]['active']
        ..typeId = doc.getList(business_)[i]['typeId'].toString()
        ..userId = doc.getList(business_)[i]['userId'].toString()
        ..timeZone = doc.getList(business_)[i]['timeZone']
        ..businessUrl = doc.getList(business_)[i]['businessUrl']
        ..createdAt = doc.getList(business_)[i]['country']));
    }
    return business;
  }

  // ignore: missing_return
  Future<List<Product>> buildProduct(Document doc, Store<AppState> store) async {}

  List<Branch> buildBranchModel(Document doc, Store<AppState> store) {
    // ignore: always_specify_types
    final List<Branch> branch = [];
    const String branch_ = 'branches';

    if (doc.getList(branch_) == null) return branch;
    for (int i = 0; i < doc.getList('branches').length; i++) {
      branch.add(Branch((BranchBuilder b) => b
        ..name = doc.getList(branch_)[i]['name']
        ..id = doc.getList(branch_)[i]['id']
        ..active = doc.getList(branch_)[i]['active']
        ..businessId = doc
            .getList(branch_)[i]['businessId']
            .toString() //TODO(richard): remove toString() when desktop set it as string
        ..createdAt = doc.getList(branch_)[i]['createdAt']
        ..mapLatitude = doc.getList(branch_)[i]['mapLatitude'].toString()
        ..mapLongitude = doc.getList(branch_)[i]['mapLongitude'].toString()
        ..mapLongitude = doc.getList(branch_)[i]['mapLongitude'].toString()
        ..updatedAt = doc.getList(branch_)[i]['updatedAt']));
    }
    return branch;
  }

  // ignore: always_specify_types
  Future<dynamic> createProduct(map) async {
    assert(map['_id'] != null);
    final Document products = await getDocumentWithId(map['_id']);

    assert(map['channel'] != null);
    assert(map['name'] != null);
    assert(map['active'] != null);
    assert(map['businessId'] != null);
    assert(map['hasPicture'] != null);
    assert(map['isDraft'] != null);
    assert(map['picture'] != null);
    assert(map['color'] != null);
    assert(map['taxId'] != null);
    assert(map['isCurrentUpdate'] != null);
    assert(map['id'] != null);
    assert(map['supplierId'] != null);
    assert(map['categoryId'] != null);
    assert(map['createdAt'] != null);
    assert(map['updatedAt'] != null);

    // ignore: always_specify_types
    final List m = [map];
    // List m2 = products.getList('products');
    // m2.addAll(m);
    products
        .toMutable()
        .setList('products', m) //here was when we were not overriding m2
        // .setList('channels', [map['channel']])
        .setString('uid', Uuid().v1())
        .setString('_id', map['_id']);

    return await saveDocumentWithId(map['_id'], products);
  }

  Future<dynamic> createVariant(Map map) async {
    assert(map['_id'] != null);
    final Document variants = await getDocumentWithId(map['_id']);

    assert(map['channel'] != null);
    assert(map['SKU'] != null);
    assert(map['name'] != null);
    assert(map['productId'] != null);
    assert(map['id'] != null);
    assert(map['createdAt'] != null);
    assert(map['updatedAt'] != null);

    // ignore: always_specify_types
    final List m = [map];
    // List m2 = variants.getList('variants');
    // m.addAll(m2);

    variants
        .toMutable()
        .setList('variants', m)
        // .setList('channels', [map['channel']])
        .setString('uid', Uuid().v1())
        .setString('_id', map['_id']);

    return await saveDocumentWithId(map['_id'], variants);
  }

  Future<dynamic> createBranchProduct(Map map) async {
    assert(map['_id'] != null);
    final Document branchProducts = await getDocumentWithId(map['_id']);

    assert(map['channel'] != null);
    assert(map['productId'] != null);
    assert(map['branchId'] != null);
    assert(map['id'] != null);

    // ignore: always_specify_types
    final List m = [map];
    // List m2 = branchProducts.getList('branchProducts');
    // m.addAll(m2);

    branchProducts
        .toMutable()
        .setList('branchProducts', m)
        // .setList('channels', [map['channel']])
        .setString('uid', Uuid().v1())
        .setString('_id', map['_id']);

    return await saveDocumentWithId(map['_id'], branchProducts);
  }

  // ignore: always_specify_types
  Future<dynamic> createStockHistory(map) async {
    assert(map['_id'] != null);
    final Document history = await getDocumentWithId(map['_id']);

    assert(map['channel'] != null);
    assert(map['variantId'] != null);
    assert(map['stockId'] != null);
    assert(map['quantity'] != null);
    assert(map['reason'] != null);
    assert(map['note'] != null);
    assert(map['updatedAt'] != null);
    assert(map['createdAt'] != null);
    assert(map['id'] != null);

    // ignore: always_specify_types
    final List m = [map];
    // List m2 = history.getList('stockHistory');
    // m.addAll(m2);

    history
        .toMutable()
        .setList('stockHistory', m)
        // .setList('channels', [map['channel']])
        .setString('uid', Uuid().v1())
        .setString('_id', map['_id']);

    return await saveDocumentWithId(map['_id'], history);
  }

  Future<dynamic> createStock(Map map) async {
    assert(map['_id'] != null);
    final Document stocks = await getDocumentWithId(map['_id']);

    assert(map['channel'] != null);
    assert(map['productId'] != null);
    assert(map['retailPrice'] != null);
    assert(map['supplyPrice'] != null);
    assert(map['canTrackingStock'] != null);
    assert(map['lowStock'] != null);
    assert(map['variantId'] != null);
    assert(map['showLowStockAlert'] != null);
    assert(map['currentStock'] != null);
    assert(map['isActive'] != null);
    assert(map['branchId'] != null);
    assert(map['branchId'] != null);
    assert(map['id'] != null);
    assert(map['createdAt'] != null);
    assert(map['updatedAt'] != null);

    // ignore: always_specify_types
    final List m = [map];
    

    stocks
        .toMutable()
        .setList('stocks', m)
        .setString('channel', map['channel'])
        .setString('uid', Uuid().v1())
        .setString('_id', map['_id']);

    return await saveDocumentWithId(map['_id'], stocks);
  }

  Future<dynamic> syncLocalToRemote(
      {Store<AppState> store, String partial}) async {
    //L stands for local and R stands for remote.
    switch (partial) {
      case 'Business':
        await syncBusinessLRemote(store);
        break;
      case 'Variant':
        await syncVariantLRemote(store);
        break;
      case 'Stock':
        await syncStockLRemote(store);
        break;
      case 'Order':
        await syncOrderLRemote(store);
        break;
      default:
        await syncBusinessLRemote(store);
        await syncVariantLRemote(store);
        await syncProductsLRemote(store);
        await syncStockLRemote(store);
        await syncBranchProductLRemote(store);
        await syncOrderDetailLRemote(store);
        await syncOrdersLRemote(store);
    }
  }

  // ignore: always_specify_types
  Future syncBranchProductLRemote(Store<AppState> store) async {
    final List<BranchProductTableData> branchProducts =
        await store.state.database.branchProductDao.branchProducts();

    final Document bP = await getDocumentWithId(
        'branchProducts_' + store.state.userId.toString());

    // ignore: always_specify_types
    final List mapTypeListBranchProducts = [];
    for (int i = 0; i < branchProducts.length; i++) {
      // ignore: always_specify_types
      final map = {
        'branchId': branchProducts[i].branchId,
        'id': branchProducts[i].id,
        'productId': branchProducts[i].productId,
      };
      mapTypeListBranchProducts.add(map);
    }

    bP
        .toMutable()
        .setList('branchProducts', mapTypeListBranchProducts)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'branchProducts_' + store.state.userId.toString());

    await saveDocumentWithId(
        'branchProducts_' + store.state.userId.toString(), bP);
  }

  Future<Document> syncStockLRemote(Store<AppState> store) async {
    // ignore: prefer_final_locals
    List<StockTableData> stocks =
        await store.state.database.stockDao.getStocks();

    // ignore: prefer_final_locals
    Document stock =
        await getDocumentWithId('stocks_' + store.state.userId.toString());

    // ignore: prefer_final_locals
    List mapTypeListStocks = [];
    // ignore: always_specify_types
    for (var i = 0; i < stocks.length; i++) {
      final Map<String, Object> map = {
        'currentStock': stocks[i].currentStock,
        'id': stocks[i].id,
        'lowStock': stocks[i].lowStock,
        'canTrackingStock': stocks[i].canTrackingStock,
        'showLowStockAlert': stocks[i].showLowStockAlert,
        'isActive': stocks[i].isActive,
        'supplyPrice': stocks[i].supplyPrice,
        'retailPrice': stocks[i].retailPrice,
        'variantId': stocks[i].variantId,
        'branchId': stocks[i].branchId,
        'productId': stocks[i].productId,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      };
      mapTypeListStocks.add(map);
    }

    stock
        .toMutable()
        .setList('stocks', mapTypeListStocks)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'stocks_' + store.state.userId.toString());

    await saveDocumentWithId('stocks_' + store.state.userId.toString(), stock);
    return stock;
  }

  // ignore: always_specify_types
  Future syncProductsLRemote(Store<AppState> store) async {
    final List<ProductTableData> products =
        await store.state.database.productDao.getProducts();

    final Document product =
        await getDocumentWithId('products_' + store.state.userId.toString());

    // ignore: always_specify_types
    final List mapTypeListProducts = [];
    for (int i = 0; i < products.length; i++) {
      final Map<String, Object> map = {
        'name': products[i].name,
        'id': products[i].id,
        'color': products[i].color,
        'picture': products[i].picture,
        'active': products[i].active,
        'hasPicture': products[i].hasPicture,
        'isDraft': products[i].isDraft,
        'isCurrentUpdate': products[i].isCurrentUpdate,
        'description': products[i].description,
        'businessId': products[i].businessId,
        'supplierId': products[i].supplierId,
        'categoryId': products[i].categoryId,
        'taxId': products[i].taxId,
        'createdAt': products[i].createdAt.toIso8601String(),
        'updatedAt': products[i].updatedAt == null
            ? DateTime.now().toIso8601String()
            : products[i].updatedAt.toIso8601String(),
      };
      mapTypeListProducts.add(map);
    }

    product
        .toMutable()
        .setList('products', mapTypeListProducts)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'products_' + store.state.userId.toString());

    await saveDocumentWithId(
        'products_' + store.state.userId.toString(), product);
  }

  Future<List<VariationTableData>> syncVariantLRemote(
      Store<AppState> store) async {
    final List<VariationTableData> variations =
        await store.state.database.variationDao.getVariations();

    final Document variant =
        await getDocumentWithId('variants_' + store.state.userId.toString());

    // ignore: always_specify_types
    final List mapTypeListVariants = [];
    for (int i = 0; i < variations.length; i++) {
      final Map<String, String> map = {
        'name': variations[i].name,
        'id': variations[i].id,
        'sku': variations[i].sku,
        'unit': variations[i].unit,
        'productId': variations[i].productId,
        'createdAt': variations[i].createdAt.toIso8601String(),
        'updatedAt': variations[i].updatedAt == null
            ? DateTime.now().toIso8601String()
            : variations[i].updatedAt.toIso8601String(),
      };
      mapTypeListVariants.add(map);
    }

    variant
        .toMutable()
        .setList('variants', mapTypeListVariants)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'variants_' + store.state.userId.toString());

    await saveDocumentWithId(
        'variants_' + store.state.userId.toString(), variant);
    return variations;
  }

  // ignore: always_specify_types
  Future syncOrderLRemote(Store<AppState> store) async {
    await syncOrderDetailLRemote(store);
    await syncOrdersLRemote(store);
    //sync stock too.
    await syncStockLRemote(store);
  }

  // ignore: always_specify_types
  Future syncOrderDetailLRemote(Store<AppState> store) async {
    final List<OrderDetailTableData> orderDetails =
        await store.state.database.orderDetailDao.getCarts();

    final Document orderDetail = await getDocumentWithId(
        'orderDetails_' + store.state.userId.toString());

    // ignore: always_specify_types
    final mapOrderDetail = [];
    for (int i = 0; i < orderDetails.length; i++) {
      final Map<String, Object> map = {
        'id': orderDetails[i].id,
        'branchId': orderDetails[i].branchId,
        'discountRate': orderDetails[i].discountRate,
        'discountAmount': orderDetails[i].discountAmount,
        'note': orderDetails[i].note,
        'taxRate': orderDetails[i].taxRate,
        'taxAmount': orderDetails[i].taxAmount,
        'quantity': orderDetails[i].quantity,
        'subTotal': orderDetails[i].subTotal,
        'orderId': orderDetails[i].orderId,
        'stockId': orderDetails[i].stockId,
        'variationId': orderDetails[i].variationId,
        'variantName': orderDetails[i].variantName,
        'productName': orderDetails[i].productName,
        'unit': orderDetails[i].unit,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      };
      mapOrderDetail.add(map);
    }

    orderDetail
        .toMutable()
        .setList('orderDetails', mapOrderDetail)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'orderDetails_' + store.state.userId.toString());
    await saveDocumentWithId(
        'orderDetails_' + store.state.userId.toString(), orderDetail);
  }

  // ignore: always_specify_types
  Future syncOrdersLRemote(Store<AppState> store) async {
    final List<OrderTableData> orders =
        await store.state.database.orderDao.getOrders();

    final Document order =
        await getDocumentWithId('orders_' + store.state.userId.toString());

    // ignore: always_specify_types
    final List mapOrders = [];
    for (int i = 0; i < orders.length; i++) {
      final Map<String, Object> map = {
        'id': orders[i].id,
        'userId': orders[i].userId,
        'branchId': orders[i].branchId,
        'deviceId': orders[i].deviceId,
        'currency': orders[i].currency,
        'reference': orders[i].reference,
        'orderNUmber': orders[i].orderNUmber,
        'supplierId': orders[i].supplierId,
        'subTotal': orders[i].subTotal,
        'supplierInvoiceNumber': orders[i].supplierInvoiceNumber,
        'deliverDate': orders[i].deliverDate.toIso8601String(),
        'taxRate': orders[i].taxRate,
        'taxAmount': orders[i].taxAmount,
        'count': orders[i].count,
        'variantName': orders[i].variantName,
        'discountRate': orders[i].discountRate,
        'discountAmount': orders[i].discountAmount,
        'cashReceived': orders[i].cashReceived,
        'saleTotal': orders[i].saleTotal,
        'customerSaving': orders[i].customerSaving,
        'paymentId': orders[i].paymentId,
        'orderNote': orders[i].orderNote,
        'isDraft': orders[i].isDraft,
        'status': orders[i].status,
        'orderType': orders[i].orderType,
        'customerChangeDue': orders[i].customerChangeDue
      };
      mapOrders.add(map);
    }

    order
        .toMutable()
        .setList('orders', mapOrders)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'orders_' + store.state.userId.toString());

    await saveDocumentWithId('orders_' + store.state.userId.toString(), order);
  }

  // ignore: always_specify_types
  Future syncBusinessLRemote(Store<AppState> store) async {
    final List<BusinessTableData> businesses =
        await store.state.database.businessDao.getBusinesses();

    final Document business =
        await getDocumentWithId('business_' + store.state.userId.toString());
    // ignore: always_specify_types
    final List mapTypeListBusiness = [];
    for (int i = 0; i < businesses.length; i++) {
      final Map<String, Object> map = {
        'name': businesses[i].name,
        'id': businesses[i].id,
        'active': businesses[i].active,
        'userId': businesses[i].userId,
        'categoryId': businesses[i].categoryId,
        'typeId': businesses[i].typeId,
        'country': businesses[i].country,
        'currency': businesses[i].currency,
        'timeZone': businesses[i].timeZone,
        'longitude': businesses[i].longitude,
        'latitude': businesses[i].latitude,
        'createdAt': businesses[i].createdAt.toIso8601String(),
        'updatedAt': businesses[i].updatedAt == null
            ? DateTime.now().toIso8601String()
            : businesses[i].updatedAt.toIso8601String(),
      };
      mapTypeListBusiness.add(map);
    }
    business
        .toMutable()
        .setList('businesses', mapTypeListBusiness)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'business_' + store.state.userId.toString());

    await saveDocumentWithId(
        'business_' + store.state.userId.toString(), business);
  }

  // ignore: always_specify_types
  Future syncProduct(String productId, Store<AppState> store) async {
    //get product sync it to couch db
    //get product variants sync them too
    //get stock of each variant and sync them each to couch
    final ProductTableData product = await store.state.database.productDao
        .getProductById(productId: productId);

    final Map<String, Object> _mapProduct = {
      'active': product.active,
      'name': product.name,
      'id': product.id,
      'supplierId': product.supplierId,
      'hasPicture': product.hasPicture,
      'picture': product.picture,
      'isDraft': product.isDraft,
      'taxId': product.taxId,
      'isCurrentUpdate': product.isCurrentUpdate,
      'color': product.color,
      '_id': 'products_' + store.state.userId.toString(),
      'categoryId':
          product.categoryId, //pet store a default id when signup on mobile
      'channel': store.state.userId.toString(),
      'businessId':
          product.businessId, //pet store a default id when signup on mobile
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    };
    await createProduct(_mapProduct);

    //sync variants
    final List<VariationTableData> variations = await store
        .state.database.variationDao
        .getVariantByProductId(productId: productId);

    for (int i = 0; i < variations.length; i++) {
      final Map<String, String> _mapVariant = {
        'name': variations[i].name,
        'productId': variations[i].productId,
        'id': variations[i].id,
        'channel': store.state.userId.toString(),
        'unit': variations[i].unit,
        'createdAt': variations[i].createdAt.toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
        'SKU': variations[i].sku,
        '_id': 'variants_' + store.state.userId.toString(),
      };
      //sync stock:
      final StockTableData stock = await store.state.database.stockDao
          .getStockByVariantId(
              variantId: variations[i].id, branchId: store.state.branch.id);

      //sync stock history:
      final StockHistoryTableData history = await store.state.database.stockHistoryDao
          .getByVariantId(variantId: variations[i].id);
      if (history != null) {
        final Map<String, Object> _history = {
          'variantId': history.variantId,
          'stockId': history.stockId,
          'quantity': history.quantity,
          'note': history.note,
          'reason': history.reason,
          'id': history.id,
          '_id': 'stockHistory_' + store.state.userId.toString(),
          'channel': store.state.userId.toString(),
          'createdAt': history.createdAt.toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
        };
        await createStockHistory(_history);
      }

      // ignore: always_specify_types
      final Map _mapStock = {
        'branchId': stock.branchId,
        'productId': productId,
        'createdAt': stock.createdAt.toIso8601String(),
        'id': stock.id,
        '_id': 'stocks_' + store.state.userId.toString(),
        'channel': store.state.userId.toString(),
        'variantId': stock.variantId,
        'retailPrice': stock.retailPrice,
        'supplyPrice': stock.supplyPrice,
        'isActive': stock.isActive,
        'showLowStockAlert': stock.showLowStockAlert,
        'updatedAt': DateTime.now().toIso8601String(),
        'canTrackingStock': stock.canTrackingStock,
        'lowStock': stock.lowStock,
        'currentStock': stock.currentStock,
      };
      await createVariant(_mapVariant);
      await createStock(_mapStock);
    }

    //sync branchProduct:

    final BranchProductTableData branchProduct = await store
        .state.database.branchProductDao
        .getBranchProduct(productId: productId);
    final  Map<String, String> _mapBranchProduct = {
      'id': branchProduct.id,
      'branchId': branchProduct.branchId,
      'productId': branchProduct.productId,
      'channel': store.state.userId.toString(),
      '_id': 'branchProducts_' + store.state.userId.toString(),
    };
    await createBranchProduct(_mapBranchProduct);
  }

  //database listners, provide listners for database then sync
  //the data being touched or inserted this is the most effective way
  //of syncing small database changes so we can avoid 1MB constraints of couchDB.
  // ignore: always_declare_return_types
  dbListner({Store<AppState> store}) async {
    store.state.database.listner.streamUpdate().listen((stock) {
      if (stock != null && stock.action != 'NONE') {
        insertHistory(store, stock);
      }
    });

    store.state.database.listner.streamInsert().listen((stock) {
      if (stock.action != 'NONE') {
        insertHistory(store, stock);
      }
    });

    //now sync them.
    store.state.database.listner.listenOnStockHistory().listen((history) {
      partialSyncHistory(history: history);
    });
  }

  void insertHistory(Store<AppState> store, StockTableData stock) {
    store.state.database.stockHistoryDao.insert(
      //ignore:missing_required_param
      StockHistoryTableData(
        id: Uuid().v1(),
        note: stock.action + stock.currentStock.toString() + 'qty',
        reason: stock.action,
        stockId: stock.id,
        variantId: stock.variantId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        quantity: stock.currentStock,
      ),
    );
  }

  // ignore: always_declare_return_types
  partialSyncHistory(
      {StockHistoryTableData history, Store<AppState> store}) async {
    final Document histo = await getDocumentWithId(
        'stockHistory_' + store.state.userId.toString());
    // ignore: always_specify_types
    final  List mapHistory = [];
    final Map<String, Object> map = {
      'id': history.id,
      'stockId': history.id,
      'reason': history.reason,
      'variantId': history.variantId,
      'note': history.note,
      'quantity': history.quantity,
    };
    mapHistory.add(map);
    histo
        .toMutable()
        .setList('stockHistory', mapHistory)
        // .setList('channels', [store.state.userId.toString()])
        .setString('uid', Uuid().v1())
        .setString('_id', 'stockHistory_' + store.state.userId.toString());
    await saveDocumentWithId(
        'stockHistory_' + store.state.userId.toString(), histo);
  }
}
