// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPasswordModelCollection on Isar {
  IsarCollection<PasswordModel> get passwordModels => this.collection();
}

const PasswordModelSchema = CollectionSchema(
  name: r'PasswordModel',
  id: 4623773523355969849,
  properties: {
    r'nickName': PropertySchema(
      id: 0,
      name: r'nickName',
      type: IsarType.string,
    ),
    r'passwordId': PropertySchema(
      id: 1,
      name: r'passwordId',
      type: IsarType.string,
    ),
    r'serviceName': PropertySchema(
      id: 2,
      name: r'serviceName',
      type: IsarType.string,
    )
  },
  estimateSize: _passwordModelEstimateSize,
  serialize: _passwordModelSerialize,
  deserialize: _passwordModelDeserialize,
  deserializeProp: _passwordModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _passwordModelGetId,
  getLinks: _passwordModelGetLinks,
  attach: _passwordModelAttach,
  version: '3.0.5',
);

int _passwordModelEstimateSize(
  PasswordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nickName.length * 3;
  bytesCount += 3 + object.passwordId.length * 3;
  bytesCount += 3 + object.serviceName.length * 3;
  return bytesCount;
}

void _passwordModelSerialize(
  PasswordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nickName);
  writer.writeString(offsets[1], object.passwordId);
  writer.writeString(offsets[2], object.serviceName);
}

PasswordModel _passwordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PasswordModel();
  object.id = id;
  object.nickName = reader.readString(offsets[0]);
  object.passwordId = reader.readString(offsets[1]);
  object.serviceName = reader.readString(offsets[2]);
  return object;
}

P _passwordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _passwordModelGetId(PasswordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _passwordModelGetLinks(PasswordModel object) {
  return [];
}

void _passwordModelAttach(
    IsarCollection<dynamic> col, Id id, PasswordModel object) {
  object.id = id;
}

extension PasswordModelQueryWhereSort
    on QueryBuilder<PasswordModel, PasswordModel, QWhere> {
  QueryBuilder<PasswordModel, PasswordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PasswordModelQueryWhere
    on QueryBuilder<PasswordModel, PasswordModel, QWhereClause> {
  QueryBuilder<PasswordModel, PasswordModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PasswordModelQueryFilter
    on QueryBuilder<PasswordModel, PasswordModel, QFilterCondition> {
  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nickName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nickName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickName',
        value: '',
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      nickNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nickName',
        value: '',
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passwordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passwordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passwordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passwordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passwordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passwordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passwordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordId',
        value: '',
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      passwordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passwordId',
        value: '',
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceName',
        value: '',
      ));
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterFilterCondition>
      serviceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceName',
        value: '',
      ));
    });
  }
}

extension PasswordModelQueryObject
    on QueryBuilder<PasswordModel, PasswordModel, QFilterCondition> {}

extension PasswordModelQueryLinks
    on QueryBuilder<PasswordModel, PasswordModel, QFilterCondition> {}

extension PasswordModelQuerySortBy
    on QueryBuilder<PasswordModel, PasswordModel, QSortBy> {
  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> sortByNickName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.asc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy>
      sortByNickNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.desc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> sortByPasswordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordId', Sort.asc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy>
      sortByPasswordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordId', Sort.desc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> sortByServiceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceName', Sort.asc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy>
      sortByServiceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceName', Sort.desc);
    });
  }
}

extension PasswordModelQuerySortThenBy
    on QueryBuilder<PasswordModel, PasswordModel, QSortThenBy> {
  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> thenByNickName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.asc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy>
      thenByNickNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.desc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> thenByPasswordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordId', Sort.asc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy>
      thenByPasswordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordId', Sort.desc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy> thenByServiceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceName', Sort.asc);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QAfterSortBy>
      thenByServiceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceName', Sort.desc);
    });
  }
}

extension PasswordModelQueryWhereDistinct
    on QueryBuilder<PasswordModel, PasswordModel, QDistinct> {
  QueryBuilder<PasswordModel, PasswordModel, QDistinct> distinctByNickName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QDistinct> distinctByPasswordId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passwordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PasswordModel, PasswordModel, QDistinct> distinctByServiceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceName', caseSensitive: caseSensitive);
    });
  }
}

extension PasswordModelQueryProperty
    on QueryBuilder<PasswordModel, PasswordModel, QQueryProperty> {
  QueryBuilder<PasswordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PasswordModel, String, QQueryOperations> nickNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickName');
    });
  }

  QueryBuilder<PasswordModel, String, QQueryOperations> passwordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passwordId');
    });
  }

  QueryBuilder<PasswordModel, String, QQueryOperations> serviceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceName');
    });
  }
}
