// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moorDB.dart';

// ignore_for_file: type=lint
class $WeathersTable extends Weathers with TableInfo<$WeathersTable, Weather> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeathersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cityNameMeta =
      const VerificationMeta('cityName');
  @override
  late final GeneratedColumn<String> cityName = GeneratedColumn<String>(
      'city_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _countryNameMeta =
      const VerificationMeta('countryName');
  @override
  late final GeneratedColumn<String> countryName = GeneratedColumn<String>(
      'country_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _mainMeta = const VerificationMeta('main');
  @override
  late final GeneratedColumn<String> main = GeneratedColumn<String>(
      'main', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxTemperatureMeta =
      const VerificationMeta('maxTemperature');
  @override
  late final GeneratedColumn<double> maxTemperature = GeneratedColumn<double>(
      'max_temperature', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _minTemperatureMeta =
      const VerificationMeta('minTemperature');
  @override
  late final GeneratedColumn<double> minTemperature = GeneratedColumn<double>(
      'min_temperature', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _feelslikeMeta =
      const VerificationMeta('feelslike');
  @override
  late final GeneratedColumn<double> feelslike = GeneratedColumn<double>(
      'feelslike', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _pressureMeta =
      const VerificationMeta('pressure');
  @override
  late final GeneratedColumn<int> pressure = GeneratedColumn<int>(
      'pressure', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _humidityMeta =
      const VerificationMeta('humidity');
  @override
  late final GeneratedColumn<int> humidity = GeneratedColumn<int>(
      'humidity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _visibilityMeta =
      const VerificationMeta('visibility');
  @override
  late final GeneratedColumn<int> visibility = GeneratedColumn<int>(
      'visibility', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dewPointMeta =
      const VerificationMeta('dewPoint');
  @override
  late final GeneratedColumn<double> dewPoint = GeneratedColumn<double>(
      'dew_point', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _uviMeta = const VerificationMeta('uvi');
  @override
  late final GeneratedColumn<double> uvi = GeneratedColumn<double>(
      'uvi', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _windSpeedMeta =
      const VerificationMeta('windSpeed');
  @override
  late final GeneratedColumn<double> windSpeed = GeneratedColumn<double>(
      'wind_speed', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _windDegreeMeta =
      const VerificationMeta('windDegree');
  @override
  late final GeneratedColumn<double> windDegree = GeneratedColumn<double>(
      'wind_degree', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
      'time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sunriseMeta =
      const VerificationMeta('sunrise');
  @override
  late final GeneratedColumn<int> sunrise = GeneratedColumn<int>(
      'sunrise', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sunsetMeta = const VerificationMeta('sunset');
  @override
  late final GeneratedColumn<int> sunset = GeneratedColumn<int>(
      'sunset', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconCodeMeta =
      const VerificationMeta('iconCode');
  @override
  late final GeneratedColumn<String> iconCode = GeneratedColumn<String>(
      'icon_code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hourlyForecastMeta =
      const VerificationMeta('hourlyForecast');
  @override
  late final GeneratedColumn<String> hourlyForecast = GeneratedColumn<String>(
      'hourly_forecast', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dailyForecastMeta =
      const VerificationMeta('dailyForecast');
  @override
  late final GeneratedColumn<String> dailyForecast = GeneratedColumn<String>(
      'daily_forecast', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _arCityNameMeta =
      const VerificationMeta('arCityName');
  @override
  late final GeneratedColumn<String> arCityName = GeneratedColumn<String>(
      'ar_city_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _arDescMeta = const VerificationMeta('arDesc');
  @override
  late final GeneratedColumn<String> arDesc = GeneratedColumn<String>(
      'ar_desc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        cityName,
        countryName,
        latitude,
        longitude,
        main,
        description,
        temperature,
        maxTemperature,
        minTemperature,
        feelslike,
        pressure,
        humidity,
        visibility,
        dewPoint,
        uvi,
        windSpeed,
        windDegree,
        time,
        sunrise,
        sunset,
        iconCode,
        hourlyForecast,
        dailyForecast,
        arCityName,
        arDesc
      ];
  @override
  String get aliasedName => _alias ?? 'weathers';
  @override
  String get actualTableName => 'weathers';
  @override
  VerificationContext validateIntegrity(Insertable<Weather> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('city_name')) {
      context.handle(_cityNameMeta,
          cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta));
    } else if (isInserting) {
      context.missing(_cityNameMeta);
    }
    if (data.containsKey('country_name')) {
      context.handle(
          _countryNameMeta,
          countryName.isAcceptableOrUnknown(
              data['country_name']!, _countryNameMeta));
    } else if (isInserting) {
      context.missing(_countryNameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('main')) {
      context.handle(
          _mainMeta, main.isAcceptableOrUnknown(data['main']!, _mainMeta));
    } else if (isInserting) {
      context.missing(_mainMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('max_temperature')) {
      context.handle(
          _maxTemperatureMeta,
          maxTemperature.isAcceptableOrUnknown(
              data['max_temperature']!, _maxTemperatureMeta));
    } else if (isInserting) {
      context.missing(_maxTemperatureMeta);
    }
    if (data.containsKey('min_temperature')) {
      context.handle(
          _minTemperatureMeta,
          minTemperature.isAcceptableOrUnknown(
              data['min_temperature']!, _minTemperatureMeta));
    } else if (isInserting) {
      context.missing(_minTemperatureMeta);
    }
    if (data.containsKey('feelslike')) {
      context.handle(_feelslikeMeta,
          feelslike.isAcceptableOrUnknown(data['feelslike']!, _feelslikeMeta));
    } else if (isInserting) {
      context.missing(_feelslikeMeta);
    }
    if (data.containsKey('pressure')) {
      context.handle(_pressureMeta,
          pressure.isAcceptableOrUnknown(data['pressure']!, _pressureMeta));
    } else if (isInserting) {
      context.missing(_pressureMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(_humidityMeta,
          humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta));
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('visibility')) {
      context.handle(
          _visibilityMeta,
          visibility.isAcceptableOrUnknown(
              data['visibility']!, _visibilityMeta));
    } else if (isInserting) {
      context.missing(_visibilityMeta);
    }
    if (data.containsKey('dew_point')) {
      context.handle(_dewPointMeta,
          dewPoint.isAcceptableOrUnknown(data['dew_point']!, _dewPointMeta));
    } else if (isInserting) {
      context.missing(_dewPointMeta);
    }
    if (data.containsKey('uvi')) {
      context.handle(
          _uviMeta, uvi.isAcceptableOrUnknown(data['uvi']!, _uviMeta));
    } else if (isInserting) {
      context.missing(_uviMeta);
    }
    if (data.containsKey('wind_speed')) {
      context.handle(_windSpeedMeta,
          windSpeed.isAcceptableOrUnknown(data['wind_speed']!, _windSpeedMeta));
    } else if (isInserting) {
      context.missing(_windSpeedMeta);
    }
    if (data.containsKey('wind_degree')) {
      context.handle(
          _windDegreeMeta,
          windDegree.isAcceptableOrUnknown(
              data['wind_degree']!, _windDegreeMeta));
    } else if (isInserting) {
      context.missing(_windDegreeMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('sunrise')) {
      context.handle(_sunriseMeta,
          sunrise.isAcceptableOrUnknown(data['sunrise']!, _sunriseMeta));
    } else if (isInserting) {
      context.missing(_sunriseMeta);
    }
    if (data.containsKey('sunset')) {
      context.handle(_sunsetMeta,
          sunset.isAcceptableOrUnknown(data['sunset']!, _sunsetMeta));
    } else if (isInserting) {
      context.missing(_sunsetMeta);
    }
    if (data.containsKey('icon_code')) {
      context.handle(_iconCodeMeta,
          iconCode.isAcceptableOrUnknown(data['icon_code']!, _iconCodeMeta));
    } else if (isInserting) {
      context.missing(_iconCodeMeta);
    }
    if (data.containsKey('hourly_forecast')) {
      context.handle(
          _hourlyForecastMeta,
          hourlyForecast.isAcceptableOrUnknown(
              data['hourly_forecast']!, _hourlyForecastMeta));
    } else if (isInserting) {
      context.missing(_hourlyForecastMeta);
    }
    if (data.containsKey('daily_forecast')) {
      context.handle(
          _dailyForecastMeta,
          dailyForecast.isAcceptableOrUnknown(
              data['daily_forecast']!, _dailyForecastMeta));
    } else if (isInserting) {
      context.missing(_dailyForecastMeta);
    }
    if (data.containsKey('ar_city_name')) {
      context.handle(
          _arCityNameMeta,
          arCityName.isAcceptableOrUnknown(
              data['ar_city_name']!, _arCityNameMeta));
    } else if (isInserting) {
      context.missing(_arCityNameMeta);
    }
    if (data.containsKey('ar_desc')) {
      context.handle(_arDescMeta,
          arDesc.isAcceptableOrUnknown(data['ar_desc']!, _arDescMeta));
    } else if (isInserting) {
      context.missing(_arDescMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Weather map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Weather(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cityName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city_name'])!,
      countryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_name'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      main: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temperature'])!,
      maxTemperature: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}max_temperature'])!,
      minTemperature: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}min_temperature'])!,
      feelslike: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}feelslike'])!,
      pressure: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pressure'])!,
      humidity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}humidity'])!,
      visibility: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}visibility'])!,
      dewPoint: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dew_point'])!,
      uvi: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}uvi'])!,
      windSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}wind_speed'])!,
      windDegree: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}wind_degree'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time'])!,
      sunrise: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sunrise'])!,
      sunset: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sunset'])!,
      iconCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_code'])!,
      hourlyForecast: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hourly_forecast'])!,
      dailyForecast: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}daily_forecast'])!,
      arCityName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ar_city_name'])!,
      arDesc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ar_desc'])!,
    );
  }

  @override
  $WeathersTable createAlias(String alias) {
    return $WeathersTable(attachedDatabase, alias);
  }
}

class Weather extends DataClass implements Insertable<Weather> {
  final int id;
  final String cityName;
  final String countryName;
  final double latitude;
  final double longitude;
  final String main;
  final String description;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;
  final double feelslike;
  final int pressure;
  final int humidity;
  final int visibility;
  final double dewPoint;
  final double uvi;
  final double windSpeed;
  final double windDegree;
  final int time;
  final int sunrise;
  final int sunset;
  final String iconCode;
  final String hourlyForecast;
  final String dailyForecast;
  final String arCityName;
  final String arDesc;
  const Weather(
      {required this.id,
      required this.cityName,
      required this.countryName,
      required this.latitude,
      required this.longitude,
      required this.main,
      required this.description,
      required this.temperature,
      required this.maxTemperature,
      required this.minTemperature,
      required this.feelslike,
      required this.pressure,
      required this.humidity,
      required this.visibility,
      required this.dewPoint,
      required this.uvi,
      required this.windSpeed,
      required this.windDegree,
      required this.time,
      required this.sunrise,
      required this.sunset,
      required this.iconCode,
      required this.hourlyForecast,
      required this.dailyForecast,
      required this.arCityName,
      required this.arDesc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['city_name'] = Variable<String>(cityName);
    map['country_name'] = Variable<String>(countryName);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['main'] = Variable<String>(main);
    map['description'] = Variable<String>(description);
    map['temperature'] = Variable<double>(temperature);
    map['max_temperature'] = Variable<double>(maxTemperature);
    map['min_temperature'] = Variable<double>(minTemperature);
    map['feelslike'] = Variable<double>(feelslike);
    map['pressure'] = Variable<int>(pressure);
    map['humidity'] = Variable<int>(humidity);
    map['visibility'] = Variable<int>(visibility);
    map['dew_point'] = Variable<double>(dewPoint);
    map['uvi'] = Variable<double>(uvi);
    map['wind_speed'] = Variable<double>(windSpeed);
    map['wind_degree'] = Variable<double>(windDegree);
    map['time'] = Variable<int>(time);
    map['sunrise'] = Variable<int>(sunrise);
    map['sunset'] = Variable<int>(sunset);
    map['icon_code'] = Variable<String>(iconCode);
    map['hourly_forecast'] = Variable<String>(hourlyForecast);
    map['daily_forecast'] = Variable<String>(dailyForecast);
    map['ar_city_name'] = Variable<String>(arCityName);
    map['ar_desc'] = Variable<String>(arDesc);
    return map;
  }

  WeathersCompanion toCompanion(bool nullToAbsent) {
    return WeathersCompanion(
      id: Value(id),
      cityName: Value(cityName),
      countryName: Value(countryName),
      latitude: Value(latitude),
      longitude: Value(longitude),
      main: Value(main),
      description: Value(description),
      temperature: Value(temperature),
      maxTemperature: Value(maxTemperature),
      minTemperature: Value(minTemperature),
      feelslike: Value(feelslike),
      pressure: Value(pressure),
      humidity: Value(humidity),
      visibility: Value(visibility),
      dewPoint: Value(dewPoint),
      uvi: Value(uvi),
      windSpeed: Value(windSpeed),
      windDegree: Value(windDegree),
      time: Value(time),
      sunrise: Value(sunrise),
      sunset: Value(sunset),
      iconCode: Value(iconCode),
      hourlyForecast: Value(hourlyForecast),
      dailyForecast: Value(dailyForecast),
      arCityName: Value(arCityName),
      arDesc: Value(arDesc),
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Weather(
      id: serializer.fromJson<int>(json['id']),
      cityName: serializer.fromJson<String>(json['cityName']),
      countryName: serializer.fromJson<String>(json['countryName']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      main: serializer.fromJson<String>(json['main']),
      description: serializer.fromJson<String>(json['description']),
      temperature: serializer.fromJson<double>(json['temperature']),
      maxTemperature: serializer.fromJson<double>(json['maxTemperature']),
      minTemperature: serializer.fromJson<double>(json['minTemperature']),
      feelslike: serializer.fromJson<double>(json['feelslike']),
      pressure: serializer.fromJson<int>(json['pressure']),
      humidity: serializer.fromJson<int>(json['humidity']),
      visibility: serializer.fromJson<int>(json['visibility']),
      dewPoint: serializer.fromJson<double>(json['dewPoint']),
      uvi: serializer.fromJson<double>(json['uvi']),
      windSpeed: serializer.fromJson<double>(json['windSpeed']),
      windDegree: serializer.fromJson<double>(json['windDegree']),
      time: serializer.fromJson<int>(json['time']),
      sunrise: serializer.fromJson<int>(json['sunrise']),
      sunset: serializer.fromJson<int>(json['sunset']),
      iconCode: serializer.fromJson<String>(json['iconCode']),
      hourlyForecast: serializer.fromJson<String>(json['hourlyForecast']),
      dailyForecast: serializer.fromJson<String>(json['dailyForecast']),
      arCityName: serializer.fromJson<String>(json['arCityName']),
      arDesc: serializer.fromJson<String>(json['arDesc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cityName': serializer.toJson<String>(cityName),
      'countryName': serializer.toJson<String>(countryName),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'main': serializer.toJson<String>(main),
      'description': serializer.toJson<String>(description),
      'temperature': serializer.toJson<double>(temperature),
      'maxTemperature': serializer.toJson<double>(maxTemperature),
      'minTemperature': serializer.toJson<double>(minTemperature),
      'feelslike': serializer.toJson<double>(feelslike),
      'pressure': serializer.toJson<int>(pressure),
      'humidity': serializer.toJson<int>(humidity),
      'visibility': serializer.toJson<int>(visibility),
      'dewPoint': serializer.toJson<double>(dewPoint),
      'uvi': serializer.toJson<double>(uvi),
      'windSpeed': serializer.toJson<double>(windSpeed),
      'windDegree': serializer.toJson<double>(windDegree),
      'time': serializer.toJson<int>(time),
      'sunrise': serializer.toJson<int>(sunrise),
      'sunset': serializer.toJson<int>(sunset),
      'iconCode': serializer.toJson<String>(iconCode),
      'hourlyForecast': serializer.toJson<String>(hourlyForecast),
      'dailyForecast': serializer.toJson<String>(dailyForecast),
      'arCityName': serializer.toJson<String>(arCityName),
      'arDesc': serializer.toJson<String>(arDesc),
    };
  }

  Weather copyWith(
          {int? id,
          String? cityName,
          String? countryName,
          double? latitude,
          double? longitude,
          String? main,
          String? description,
          double? temperature,
          double? maxTemperature,
          double? minTemperature,
          double? feelslike,
          int? pressure,
          int? humidity,
          int? visibility,
          double? dewPoint,
          double? uvi,
          double? windSpeed,
          double? windDegree,
          int? time,
          int? sunrise,
          int? sunset,
          String? iconCode,
          String? hourlyForecast,
          String? dailyForecast,
          String? arCityName,
          String? arDesc}) =>
      Weather(
        id: id ?? this.id,
        cityName: cityName ?? this.cityName,
        countryName: countryName ?? this.countryName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        main: main ?? this.main,
        description: description ?? this.description,
        temperature: temperature ?? this.temperature,
        maxTemperature: maxTemperature ?? this.maxTemperature,
        minTemperature: minTemperature ?? this.minTemperature,
        feelslike: feelslike ?? this.feelslike,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        visibility: visibility ?? this.visibility,
        dewPoint: dewPoint ?? this.dewPoint,
        uvi: uvi ?? this.uvi,
        windSpeed: windSpeed ?? this.windSpeed,
        windDegree: windDegree ?? this.windDegree,
        time: time ?? this.time,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        iconCode: iconCode ?? this.iconCode,
        hourlyForecast: hourlyForecast ?? this.hourlyForecast,
        dailyForecast: dailyForecast ?? this.dailyForecast,
        arCityName: arCityName ?? this.arCityName,
        arDesc: arDesc ?? this.arDesc,
      );
  @override
  String toString() {
    return (StringBuffer('Weather(')
          ..write('id: $id, ')
          ..write('cityName: $cityName, ')
          ..write('countryName: $countryName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('main: $main, ')
          ..write('description: $description, ')
          ..write('temperature: $temperature, ')
          ..write('maxTemperature: $maxTemperature, ')
          ..write('minTemperature: $minTemperature, ')
          ..write('feelslike: $feelslike, ')
          ..write('pressure: $pressure, ')
          ..write('humidity: $humidity, ')
          ..write('visibility: $visibility, ')
          ..write('dewPoint: $dewPoint, ')
          ..write('uvi: $uvi, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('windDegree: $windDegree, ')
          ..write('time: $time, ')
          ..write('sunrise: $sunrise, ')
          ..write('sunset: $sunset, ')
          ..write('iconCode: $iconCode, ')
          ..write('hourlyForecast: $hourlyForecast, ')
          ..write('dailyForecast: $dailyForecast, ')
          ..write('arCityName: $arCityName, ')
          ..write('arDesc: $arDesc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        cityName,
        countryName,
        latitude,
        longitude,
        main,
        description,
        temperature,
        maxTemperature,
        minTemperature,
        feelslike,
        pressure,
        humidity,
        visibility,
        dewPoint,
        uvi,
        windSpeed,
        windDegree,
        time,
        sunrise,
        sunset,
        iconCode,
        hourlyForecast,
        dailyForecast,
        arCityName,
        arDesc
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weather &&
          other.id == this.id &&
          other.cityName == this.cityName &&
          other.countryName == this.countryName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.main == this.main &&
          other.description == this.description &&
          other.temperature == this.temperature &&
          other.maxTemperature == this.maxTemperature &&
          other.minTemperature == this.minTemperature &&
          other.feelslike == this.feelslike &&
          other.pressure == this.pressure &&
          other.humidity == this.humidity &&
          other.visibility == this.visibility &&
          other.dewPoint == this.dewPoint &&
          other.uvi == this.uvi &&
          other.windSpeed == this.windSpeed &&
          other.windDegree == this.windDegree &&
          other.time == this.time &&
          other.sunrise == this.sunrise &&
          other.sunset == this.sunset &&
          other.iconCode == this.iconCode &&
          other.hourlyForecast == this.hourlyForecast &&
          other.dailyForecast == this.dailyForecast &&
          other.arCityName == this.arCityName &&
          other.arDesc == this.arDesc);
}

class WeathersCompanion extends UpdateCompanion<Weather> {
  final Value<int> id;
  final Value<String> cityName;
  final Value<String> countryName;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> main;
  final Value<String> description;
  final Value<double> temperature;
  final Value<double> maxTemperature;
  final Value<double> minTemperature;
  final Value<double> feelslike;
  final Value<int> pressure;
  final Value<int> humidity;
  final Value<int> visibility;
  final Value<double> dewPoint;
  final Value<double> uvi;
  final Value<double> windSpeed;
  final Value<double> windDegree;
  final Value<int> time;
  final Value<int> sunrise;
  final Value<int> sunset;
  final Value<String> iconCode;
  final Value<String> hourlyForecast;
  final Value<String> dailyForecast;
  final Value<String> arCityName;
  final Value<String> arDesc;
  const WeathersCompanion({
    this.id = const Value.absent(),
    this.cityName = const Value.absent(),
    this.countryName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.main = const Value.absent(),
    this.description = const Value.absent(),
    this.temperature = const Value.absent(),
    this.maxTemperature = const Value.absent(),
    this.minTemperature = const Value.absent(),
    this.feelslike = const Value.absent(),
    this.pressure = const Value.absent(),
    this.humidity = const Value.absent(),
    this.visibility = const Value.absent(),
    this.dewPoint = const Value.absent(),
    this.uvi = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.windDegree = const Value.absent(),
    this.time = const Value.absent(),
    this.sunrise = const Value.absent(),
    this.sunset = const Value.absent(),
    this.iconCode = const Value.absent(),
    this.hourlyForecast = const Value.absent(),
    this.dailyForecast = const Value.absent(),
    this.arCityName = const Value.absent(),
    this.arDesc = const Value.absent(),
  });
  WeathersCompanion.insert({
    this.id = const Value.absent(),
    required String cityName,
    required String countryName,
    required double latitude,
    required double longitude,
    required String main,
    required String description,
    required double temperature,
    required double maxTemperature,
    required double minTemperature,
    required double feelslike,
    required int pressure,
    required int humidity,
    required int visibility,
    required double dewPoint,
    required double uvi,
    required double windSpeed,
    required double windDegree,
    required int time,
    required int sunrise,
    required int sunset,
    required String iconCode,
    required String hourlyForecast,
    required String dailyForecast,
    required String arCityName,
    required String arDesc,
  })  : cityName = Value(cityName),
        countryName = Value(countryName),
        latitude = Value(latitude),
        longitude = Value(longitude),
        main = Value(main),
        description = Value(description),
        temperature = Value(temperature),
        maxTemperature = Value(maxTemperature),
        minTemperature = Value(minTemperature),
        feelslike = Value(feelslike),
        pressure = Value(pressure),
        humidity = Value(humidity),
        visibility = Value(visibility),
        dewPoint = Value(dewPoint),
        uvi = Value(uvi),
        windSpeed = Value(windSpeed),
        windDegree = Value(windDegree),
        time = Value(time),
        sunrise = Value(sunrise),
        sunset = Value(sunset),
        iconCode = Value(iconCode),
        hourlyForecast = Value(hourlyForecast),
        dailyForecast = Value(dailyForecast),
        arCityName = Value(arCityName),
        arDesc = Value(arDesc);
  static Insertable<Weather> custom({
    Expression<int>? id,
    Expression<String>? cityName,
    Expression<String>? countryName,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? main,
    Expression<String>? description,
    Expression<double>? temperature,
    Expression<double>? maxTemperature,
    Expression<double>? minTemperature,
    Expression<double>? feelslike,
    Expression<int>? pressure,
    Expression<int>? humidity,
    Expression<int>? visibility,
    Expression<double>? dewPoint,
    Expression<double>? uvi,
    Expression<double>? windSpeed,
    Expression<double>? windDegree,
    Expression<int>? time,
    Expression<int>? sunrise,
    Expression<int>? sunset,
    Expression<String>? iconCode,
    Expression<String>? hourlyForecast,
    Expression<String>? dailyForecast,
    Expression<String>? arCityName,
    Expression<String>? arDesc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cityName != null) 'city_name': cityName,
      if (countryName != null) 'country_name': countryName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (main != null) 'main': main,
      if (description != null) 'description': description,
      if (temperature != null) 'temperature': temperature,
      if (maxTemperature != null) 'max_temperature': maxTemperature,
      if (minTemperature != null) 'min_temperature': minTemperature,
      if (feelslike != null) 'feelslike': feelslike,
      if (pressure != null) 'pressure': pressure,
      if (humidity != null) 'humidity': humidity,
      if (visibility != null) 'visibility': visibility,
      if (dewPoint != null) 'dew_point': dewPoint,
      if (uvi != null) 'uvi': uvi,
      if (windSpeed != null) 'wind_speed': windSpeed,
      if (windDegree != null) 'wind_degree': windDegree,
      if (time != null) 'time': time,
      if (sunrise != null) 'sunrise': sunrise,
      if (sunset != null) 'sunset': sunset,
      if (iconCode != null) 'icon_code': iconCode,
      if (hourlyForecast != null) 'hourly_forecast': hourlyForecast,
      if (dailyForecast != null) 'daily_forecast': dailyForecast,
      if (arCityName != null) 'ar_city_name': arCityName,
      if (arDesc != null) 'ar_desc': arDesc,
    });
  }

  WeathersCompanion copyWith(
      {Value<int>? id,
      Value<String>? cityName,
      Value<String>? countryName,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String>? main,
      Value<String>? description,
      Value<double>? temperature,
      Value<double>? maxTemperature,
      Value<double>? minTemperature,
      Value<double>? feelslike,
      Value<int>? pressure,
      Value<int>? humidity,
      Value<int>? visibility,
      Value<double>? dewPoint,
      Value<double>? uvi,
      Value<double>? windSpeed,
      Value<double>? windDegree,
      Value<int>? time,
      Value<int>? sunrise,
      Value<int>? sunset,
      Value<String>? iconCode,
      Value<String>? hourlyForecast,
      Value<String>? dailyForecast,
      Value<String>? arCityName,
      Value<String>? arDesc}) {
    return WeathersCompanion(
      id: id ?? this.id,
      cityName: cityName ?? this.cityName,
      countryName: countryName ?? this.countryName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      main: main ?? this.main,
      description: description ?? this.description,
      temperature: temperature ?? this.temperature,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
      feelslike: feelslike ?? this.feelslike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      visibility: visibility ?? this.visibility,
      dewPoint: dewPoint ?? this.dewPoint,
      uvi: uvi ?? this.uvi,
      windSpeed: windSpeed ?? this.windSpeed,
      windDegree: windDegree ?? this.windDegree,
      time: time ?? this.time,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      iconCode: iconCode ?? this.iconCode,
      hourlyForecast: hourlyForecast ?? this.hourlyForecast,
      dailyForecast: dailyForecast ?? this.dailyForecast,
      arCityName: arCityName ?? this.arCityName,
      arDesc: arDesc ?? this.arDesc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String>(cityName.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String>(countryName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (main.present) {
      map['main'] = Variable<String>(main.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (maxTemperature.present) {
      map['max_temperature'] = Variable<double>(maxTemperature.value);
    }
    if (minTemperature.present) {
      map['min_temperature'] = Variable<double>(minTemperature.value);
    }
    if (feelslike.present) {
      map['feelslike'] = Variable<double>(feelslike.value);
    }
    if (pressure.present) {
      map['pressure'] = Variable<int>(pressure.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<int>(humidity.value);
    }
    if (visibility.present) {
      map['visibility'] = Variable<int>(visibility.value);
    }
    if (dewPoint.present) {
      map['dew_point'] = Variable<double>(dewPoint.value);
    }
    if (uvi.present) {
      map['uvi'] = Variable<double>(uvi.value);
    }
    if (windSpeed.present) {
      map['wind_speed'] = Variable<double>(windSpeed.value);
    }
    if (windDegree.present) {
      map['wind_degree'] = Variable<double>(windDegree.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (sunrise.present) {
      map['sunrise'] = Variable<int>(sunrise.value);
    }
    if (sunset.present) {
      map['sunset'] = Variable<int>(sunset.value);
    }
    if (iconCode.present) {
      map['icon_code'] = Variable<String>(iconCode.value);
    }
    if (hourlyForecast.present) {
      map['hourly_forecast'] = Variable<String>(hourlyForecast.value);
    }
    if (dailyForecast.present) {
      map['daily_forecast'] = Variable<String>(dailyForecast.value);
    }
    if (arCityName.present) {
      map['ar_city_name'] = Variable<String>(arCityName.value);
    }
    if (arDesc.present) {
      map['ar_desc'] = Variable<String>(arDesc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeathersCompanion(')
          ..write('id: $id, ')
          ..write('cityName: $cityName, ')
          ..write('countryName: $countryName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('main: $main, ')
          ..write('description: $description, ')
          ..write('temperature: $temperature, ')
          ..write('maxTemperature: $maxTemperature, ')
          ..write('minTemperature: $minTemperature, ')
          ..write('feelslike: $feelslike, ')
          ..write('pressure: $pressure, ')
          ..write('humidity: $humidity, ')
          ..write('visibility: $visibility, ')
          ..write('dewPoint: $dewPoint, ')
          ..write('uvi: $uvi, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('windDegree: $windDegree, ')
          ..write('time: $time, ')
          ..write('sunrise: $sunrise, ')
          ..write('sunset: $sunset, ')
          ..write('iconCode: $iconCode, ')
          ..write('hourlyForecast: $hourlyForecast, ')
          ..write('dailyForecast: $dailyForecast, ')
          ..write('arCityName: $arCityName, ')
          ..write('arDesc: $arDesc')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $WeathersTable weathers = $WeathersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [weathers];
}
