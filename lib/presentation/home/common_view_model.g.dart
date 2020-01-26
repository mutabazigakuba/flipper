// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommonViewModel extends CommonViewModel {
  @override
  final bool hasUser;
  @override
  final bool hasSheet;
  @override
  final bool hasHint;
  @override
  final BuiltList<Unit> units;
  @override
  final BuiltList<Category> categories;
  @override
  final int tab;
  @override
  final Business currentBusiness;
  @override
  final bool hasAction;
  @override
  final List<Branch> branches;
  @override
  final List<Business> businesses;
  @override
  final AppActions appAction;
  @override
  final Hint hint;
  @override
  final String categoryName;
  @override
  final Category category;
  @override
  final Unit currentUnit;
  @override
  final Category currentCategory;
  @override
  final FlipperColor currentColor;
  @override
  final Disable currentDisable;
  @override
  final BuiltList<Variation> variations;

  factory _$CommonViewModel([void Function(CommonViewModelBuilder) updates]) =>
      (new CommonViewModelBuilder()..update(updates)).build();

  _$CommonViewModel._(
      {this.hasUser,
      this.hasSheet,
      this.hasHint,
      this.units,
      this.categories,
      this.tab,
      this.currentBusiness,
      this.hasAction,
      this.branches,
      this.businesses,
      this.appAction,
      this.hint,
      this.categoryName,
      this.category,
      this.currentUnit,
      this.currentCategory,
      this.currentColor,
      this.currentDisable,
      this.variations})
      : super._() {
    if (hasUser == null) {
      throw new BuiltValueNullFieldError('CommonViewModel', 'hasUser');
    }
    if (hasSheet == null) {
      throw new BuiltValueNullFieldError('CommonViewModel', 'hasSheet');
    }
    if (categories == null) {
      throw new BuiltValueNullFieldError('CommonViewModel', 'categories');
    }
    if (hasAction == null) {
      throw new BuiltValueNullFieldError('CommonViewModel', 'hasAction');
    }
    if (branches == null) {
      throw new BuiltValueNullFieldError('CommonViewModel', 'branches');
    }
    if (businesses == null) {
      throw new BuiltValueNullFieldError('CommonViewModel', 'businesses');
    }
    if (hint == null) {
      throw new BuiltValueNullFieldError('CommonViewModel', 'hint');
    }
  }

  @override
  CommonViewModel rebuild(void Function(CommonViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommonViewModelBuilder toBuilder() =>
      new CommonViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommonViewModel &&
        hasUser == other.hasUser &&
        hasSheet == other.hasSheet &&
        hasHint == other.hasHint &&
        units == other.units &&
        categories == other.categories &&
        tab == other.tab &&
        currentBusiness == other.currentBusiness &&
        hasAction == other.hasAction &&
        branches == other.branches &&
        businesses == other.businesses &&
        appAction == other.appAction &&
        hint == other.hint &&
        categoryName == other.categoryName &&
        category == other.category &&
        currentUnit == other.currentUnit &&
        currentCategory == other.currentCategory &&
        currentColor == other.currentColor &&
        currentDisable == other.currentDisable &&
        variations == other.variations;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                hasUser
                                                                                    .hashCode),
                                                                            hasSheet
                                                                                .hashCode),
                                                                        hasHint
                                                                            .hashCode),
                                                                    units
                                                                        .hashCode),
                                                                categories
                                                                    .hashCode),
                                                            tab.hashCode),
                                                        currentBusiness
                                                            .hashCode),
                                                    hasAction.hashCode),
                                                branches.hashCode),
                                            businesses.hashCode),
                                        appAction.hashCode),
                                    hint.hashCode),
                                categoryName.hashCode),
                            category.hashCode),
                        currentUnit.hashCode),
                    currentCategory.hashCode),
                currentColor.hashCode),
            currentDisable.hashCode),
        variations.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommonViewModel')
          ..add('hasUser', hasUser)
          ..add('hasSheet', hasSheet)
          ..add('hasHint', hasHint)
          ..add('units', units)
          ..add('categories', categories)
          ..add('tab', tab)
          ..add('currentBusiness', currentBusiness)
          ..add('hasAction', hasAction)
          ..add('branches', branches)
          ..add('businesses', businesses)
          ..add('appAction', appAction)
          ..add('hint', hint)
          ..add('categoryName', categoryName)
          ..add('category', category)
          ..add('currentUnit', currentUnit)
          ..add('currentCategory', currentCategory)
          ..add('currentColor', currentColor)
          ..add('currentDisable', currentDisable)
          ..add('variations', variations))
        .toString();
  }
}

class CommonViewModelBuilder
    implements Builder<CommonViewModel, CommonViewModelBuilder> {
  _$CommonViewModel _$v;

  bool _hasUser;
  bool get hasUser => _$this._hasUser;
  set hasUser(bool hasUser) => _$this._hasUser = hasUser;

  bool _hasSheet;
  bool get hasSheet => _$this._hasSheet;
  set hasSheet(bool hasSheet) => _$this._hasSheet = hasSheet;

  bool _hasHint;
  bool get hasHint => _$this._hasHint;
  set hasHint(bool hasHint) => _$this._hasHint = hasHint;

  ListBuilder<Unit> _units;
  ListBuilder<Unit> get units => _$this._units ??= new ListBuilder<Unit>();
  set units(ListBuilder<Unit> units) => _$this._units = units;

  ListBuilder<Category> _categories;
  ListBuilder<Category> get categories =>
      _$this._categories ??= new ListBuilder<Category>();
  set categories(ListBuilder<Category> categories) =>
      _$this._categories = categories;

  int _tab;
  int get tab => _$this._tab;
  set tab(int tab) => _$this._tab = tab;

  BusinessBuilder _currentBusiness;
  BusinessBuilder get currentBusiness =>
      _$this._currentBusiness ??= new BusinessBuilder();
  set currentBusiness(BusinessBuilder currentBusiness) =>
      _$this._currentBusiness = currentBusiness;

  bool _hasAction;
  bool get hasAction => _$this._hasAction;
  set hasAction(bool hasAction) => _$this._hasAction = hasAction;

  List<Branch> _branches;
  List<Branch> get branches => _$this._branches;
  set branches(List<Branch> branches) => _$this._branches = branches;

  List<Business> _businesses;
  List<Business> get businesses => _$this._businesses;
  set businesses(List<Business> businesses) => _$this._businesses = businesses;

  AppActionsBuilder _appAction;
  AppActionsBuilder get appAction =>
      _$this._appAction ??= new AppActionsBuilder();
  set appAction(AppActionsBuilder appAction) => _$this._appAction = appAction;

  HintBuilder _hint;
  HintBuilder get hint => _$this._hint ??= new HintBuilder();
  set hint(HintBuilder hint) => _$this._hint = hint;

  String _categoryName;
  String get categoryName => _$this._categoryName;
  set categoryName(String categoryName) => _$this._categoryName = categoryName;

  CategoryBuilder _category;
  CategoryBuilder get category => _$this._category ??= new CategoryBuilder();
  set category(CategoryBuilder category) => _$this._category = category;

  UnitBuilder _currentUnit;
  UnitBuilder get currentUnit => _$this._currentUnit ??= new UnitBuilder();
  set currentUnit(UnitBuilder currentUnit) => _$this._currentUnit = currentUnit;

  CategoryBuilder _currentCategory;
  CategoryBuilder get currentCategory =>
      _$this._currentCategory ??= new CategoryBuilder();
  set currentCategory(CategoryBuilder currentCategory) =>
      _$this._currentCategory = currentCategory;

  FlipperColorBuilder _currentColor;
  FlipperColorBuilder get currentColor =>
      _$this._currentColor ??= new FlipperColorBuilder();
  set currentColor(FlipperColorBuilder currentColor) =>
      _$this._currentColor = currentColor;

  DisableBuilder _currentDisable;
  DisableBuilder get currentDisable =>
      _$this._currentDisable ??= new DisableBuilder();
  set currentDisable(DisableBuilder currentDisable) =>
      _$this._currentDisable = currentDisable;

  ListBuilder<Variation> _variations;
  ListBuilder<Variation> get variations =>
      _$this._variations ??= new ListBuilder<Variation>();
  set variations(ListBuilder<Variation> variations) =>
      _$this._variations = variations;

  CommonViewModelBuilder();

  CommonViewModelBuilder get _$this {
    if (_$v != null) {
      _hasUser = _$v.hasUser;
      _hasSheet = _$v.hasSheet;
      _hasHint = _$v.hasHint;
      _units = _$v.units?.toBuilder();
      _categories = _$v.categories?.toBuilder();
      _tab = _$v.tab;
      _currentBusiness = _$v.currentBusiness?.toBuilder();
      _hasAction = _$v.hasAction;
      _branches = _$v.branches;
      _businesses = _$v.businesses;
      _appAction = _$v.appAction?.toBuilder();
      _hint = _$v.hint?.toBuilder();
      _categoryName = _$v.categoryName;
      _category = _$v.category?.toBuilder();
      _currentUnit = _$v.currentUnit?.toBuilder();
      _currentCategory = _$v.currentCategory?.toBuilder();
      _currentColor = _$v.currentColor?.toBuilder();
      _currentDisable = _$v.currentDisable?.toBuilder();
      _variations = _$v.variations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommonViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CommonViewModel;
  }

  @override
  void update(void Function(CommonViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommonViewModel build() {
    _$CommonViewModel _$result;
    try {
      _$result = _$v ??
          new _$CommonViewModel._(
              hasUser: hasUser,
              hasSheet: hasSheet,
              hasHint: hasHint,
              units: _units?.build(),
              categories: categories.build(),
              tab: tab,
              currentBusiness: _currentBusiness?.build(),
              hasAction: hasAction,
              branches: branches,
              businesses: businesses,
              appAction: _appAction?.build(),
              hint: hint.build(),
              categoryName: categoryName,
              category: _category?.build(),
              currentUnit: _currentUnit?.build(),
              currentCategory: _currentCategory?.build(),
              currentColor: _currentColor?.build(),
              currentDisable: _currentDisable?.build(),
              variations: _variations?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'units';
        _units?.build();
        _$failedField = 'categories';
        categories.build();

        _$failedField = 'currentBusiness';
        _currentBusiness?.build();

        _$failedField = 'appAction';
        _appAction?.build();
        _$failedField = 'hint';
        hint.build();

        _$failedField = 'category';
        _category?.build();
        _$failedField = 'currentUnit';
        _currentUnit?.build();
        _$failedField = 'currentCategory';
        _currentCategory?.build();
        _$failedField = 'currentColor';
        _currentColor?.build();
        _$failedField = 'currentDisable';
        _currentDisable?.build();
        _$failedField = 'variations';
        _variations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CommonViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
