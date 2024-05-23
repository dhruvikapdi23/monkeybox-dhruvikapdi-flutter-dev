import '../config.dart';

class Set {
  final TextEditingController kgsController;
  final TextEditingController repsController;

  Set({required this.kgsController, required this.repsController});
}

class Data {
  String? id;
  String? trainerId;
  String? gymId;
  String? name;
  String? tagIndex;
  String? namePinyin;
  String? description;
  String? instructions;
  List<String>? aliases;
  String? status;
  String? source;
  String? level;
  bool? isBodyweight;
  bool? isDistance;
  bool? isTimed;
  bool? isCardio;
  int? bodyTier;
  int? coefficient;
  bool? isAssisted;
  bool? isUnilateral;
  String? mobilityType;
  String? movementPattern;
  int? olyRating;
  int? olyTier;
  int? powerTier;
  int? tier;
  int? toneRating;
  int? rating;
  int? repsScale;
  String? parseId;
  double? relativeWeight;
  int? listPosition;
  String? preferredDistanceScale;
  String? referenceId;
  String? mediaVersion;
  String? angle0Image;
  String? angle0Video;
  String? angle1Image;
  String? angle1Video;
  String? angle2Image;
  String? angle2Video;
  String? headerImage;
  String? thumbImage;
  String? fullVideo;
  String? headerVideo;
  String? oneRepVideo;
  int? typecode;
  String? createdAt;
  String? updatedAt;
  List<Equipments>? equipments;
  List<MainMuscles>? mainMuscles;
  List<SecondaryMuscles>? secondaryMuscles;
  List<Categories>? categories;
   List<Set>? sets;

  Data(
      {this.id,
        this.trainerId,
        this.gymId,
        this.name,
        this.description,
        this.instructions,
        this.aliases,
        this.tagIndex,
        this.namePinyin,
        this.status,
        this.source,
        this.level,
        this.isBodyweight,
        this.isDistance,
        this.isTimed,
        this.isCardio,
        this.bodyTier,
        this.coefficient,
        this.isAssisted,
        this.isUnilateral,
        this.mobilityType,
        this.movementPattern,
        this.olyRating,
        this.olyTier,
        this.powerTier,
        this.tier,
        this.toneRating,
        this.rating,
        this.repsScale,
        this.parseId,
        this.relativeWeight,
        this.listPosition,
        this.preferredDistanceScale,
        this.referenceId,
        this.mediaVersion,
        this.angle0Image,
        this.angle0Video,
        this.angle1Image,
        this.angle1Video,
        this.angle2Image,
        this.angle2Video,
        this.headerImage,
        this.thumbImage,
        this.fullVideo,
        this.headerVideo,
        this.oneRepVideo,
        this.typecode,
        this.createdAt,
        this.updatedAt,
        this.equipments,
        this.mainMuscles,
        this.secondaryMuscles,
        this.categories,this.sets});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainerId = json['trainerId'];
    gymId = json['gymId'];
    name = json['name'];
    description = json['description'];
    tagIndex = json['tagIndex'];
    namePinyin = json['namePinyin'];
    aliases = json['aliases'].cast<String>();
    status = json['status'];
    source = json['source'];
    level = json['level'];
    isBodyweight = json['isBodyweight'];
    isDistance = json['isDistance'];
    isTimed = json['isTimed'];
    isCardio = json['isCardio'];
    bodyTier = json['bodyTier'];
    coefficient = json['coefficient'];
    isAssisted = json['isAssisted'];
    isUnilateral = json['isUnilateral'];
    mobilityType = json['mobilityType'];
    movementPattern = json['movementPattern'];
    olyRating = json['olyRating'];
    olyTier = json['olyTier'];
    powerTier = json['powerTier'];
    tier = json['tier'];
    toneRating = json['toneRating'];
    rating = json['rating'];
    repsScale = json['repsScale'];
    parseId = json['parseId'];
    relativeWeight =  json['relativeWeight'] != null? double.parse( json['relativeWeight'].toString()):0.0;
    listPosition = json['listPosition'];
    preferredDistanceScale = json['preferredDistanceScale'];
    referenceId = json['referenceId'];
    mediaVersion = json['mediaVersion'];
    angle0Image = json['angle0Image'];
    angle0Video = json['angle0Video'];
    angle1Image = json['angle1Image'];
    angle1Video = json['angle1Video'];
    angle2Image = json['angle2Image'];
    angle2Video = json['angle2Video'];
    headerImage = json['headerImage'];
    thumbImage = json['thumbImage'];
    fullVideo = json['fullVideo'];
    headerVideo = json['headerVideo'];
    oneRepVideo = json['oneRepVideo'];
    typecode = json['typecode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['equipments'] != null) {
      equipments = <Equipments>[];
      json['equipments'].forEach((v) {
        equipments!.add(Equipments.fromJson(v));
      });
    }
    if (json['mainMuscles'] != null) {
      mainMuscles = <MainMuscles>[];
      json['mainMuscles'].forEach((v) {
        mainMuscles!.add(MainMuscles.fromJson(v));
      });
    }
    if (json['secondaryMuscles'] != null) {
      secondaryMuscles = <SecondaryMuscles>[];
      json['secondaryMuscles'].forEach((v) {
        secondaryMuscles!.add(SecondaryMuscles.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if(json['sets'] != null){
      sets = <Set>[];
      json['sets'].forEach((v) {
        sets!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trainerId'] = trainerId;
    data['gymId'] = gymId;
    data['name'] = name;
    data['description'] = description;
    data['instructions'] = instructions;
    data['aliases'] = aliases;
    data['status'] = status;
    data['source'] = source;
    data['namePinyin'] = namePinyin;
    data['tagIndex'] = tagIndex;
    data['level'] = level;
    data['isBodyweight'] = isBodyweight;
    data['isDistance'] = isDistance;
    data['isTimed'] = isTimed;
    data['isCardio'] = isCardio;
    data['bodyTier'] = bodyTier;
    data['coefficient'] = coefficient;
    data['isAssisted'] = isAssisted;
    data['isUnilateral'] = isUnilateral;
    data['mobilityType'] = mobilityType;
    data['movementPattern'] = movementPattern;
    data['olyRating'] = olyRating;
    data['olyTier'] = olyTier;
    data['powerTier'] = powerTier;
    data['tier'] = tier;
    data['toneRating'] = toneRating;
    data['rating'] = rating;
    data['repsScale'] = repsScale;
    data['parseId'] = parseId;
    data['relativeWeight'] = relativeWeight;
    data['listPosition'] = listPosition;
    data['preferredDistanceScale'] = preferredDistanceScale;
    data['referenceId'] = referenceId;
    data['mediaVersion'] = mediaVersion;
    data['angle0Image'] = angle0Image;
    data['angle0Video'] = angle0Video;
    data['angle1Image'] = angle1Image;
    data['angle1Video'] = angle1Video;
    data['angle2Image'] = angle2Image;
    data['angle2Video'] = angle2Video;
    data['headerImage'] = headerImage;
    data['thumbImage'] = thumbImage;
    data['fullVideo'] = fullVideo;
    data['headerVideo'] = headerVideo;
    data['oneRepVideo'] = oneRepVideo;
    data['typecode'] = typecode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (equipments != null) {
      data['equipments'] = equipments!.map((v) => v.toJson()).toList();
    }
    if (mainMuscles != null) {
      data['mainMuscles'] = mainMuscles!.map((v) => v.toJson()).toList();
    }
    if (secondaryMuscles != null) {
      data['secondaryMuscles'] =
          secondaryMuscles!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (sets != null) {
      data['sets'] = sets!.map((v) => v).toList();
    }
    return data;
  }
}

class Equipments {
  String? id;
  String? description;
  String? thumbImage;
  String? name;
  String? referenceId;
  String? createdAt;
  String? updatedAt;
  ExerciseEquipment? exerciseEquipment;

  Equipments(
      {this.id,
        this.description,
        this.thumbImage,
        this.name,
        this.referenceId,
        this.createdAt,
        this.updatedAt,
        this.exerciseEquipment});

  Equipments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    thumbImage = json['thumbImage'];
    name = json['name'];
    referenceId = json['referenceId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    exerciseEquipment = json['ExerciseEquipment'] != null
        ? ExerciseEquipment.fromJson(json['ExerciseEquipment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['thumbImage'] = thumbImage;
    data['name'] = name;
    data['referenceId'] = referenceId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (exerciseEquipment != null) {
      data['ExerciseEquipment'] = exerciseEquipment!.toJson();
    }
    return data;
  }
}

class ExerciseEquipment {
  String? id;
  String? exerciseId;
  String? equipmentId;
  String? createdAt;
  String? updatedAt;

  ExerciseEquipment(
      {this.id,
        this.exerciseId,
        this.equipmentId,
        this.createdAt,
        this.updatedAt});

  ExerciseEquipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exerciseId = json['exerciseId'];
    equipmentId = json['equipmentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exerciseId'] = exerciseId;
    data['equipmentId'] = equipmentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class MainMuscles {
  String? id;
  String? description;
  bool? isAccessoryMuscle;
  bool? isCore;
  bool? isFront;
  bool? isPull;
  bool? isPush;
  bool? isUpperBody;
  String? name;
  double? utilityPercentage;
  String? referenceId;
  String? thumbImage;
  String? imageImage;
  String? createdAt;
  String? updatedAt;
  ExerciseMainMuscleGroups? exerciseMainMuscleGroups;
  List? sets;

  MainMuscles(
      {this.id,
        this.description,
        this.isAccessoryMuscle,
        this.isCore,
        this.isFront,
        this.isPull,
        this.isPush,
        this.isUpperBody,
        this.name,
        this.utilityPercentage,
        this.referenceId,
        this.thumbImage,
        this.imageImage,
        this.createdAt,
        this.updatedAt,
        this.exerciseMainMuscleGroups,this.sets});

  MainMuscles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    isAccessoryMuscle = json['isAccessoryMuscle'];
    isCore = json['isCore'];
    isFront = json['isFront'];
    isPull = json['isPull'];
    isPush = json['isPush'];
    isUpperBody = json['isUpperBody'];
    name = json['name'];
    utilityPercentage = json['utilityPercentage'];
    referenceId = json['referenceId'];
    thumbImage = json['thumbImage'];
    imageImage = json['imageImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sets = json['sets'];
    exerciseMainMuscleGroups = json['ExerciseMainMuscleGroups'] != null
        ? ExerciseMainMuscleGroups.fromJson(
        json['ExerciseMainMuscleGroups'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['isAccessoryMuscle'] = isAccessoryMuscle;
    data['isCore'] = isCore;
    data['isFront'] = isFront;
    data['isPull'] = isPull;
    data['isPush'] = isPush;
    data['isUpperBody'] = isUpperBody;
    data['name'] = name;
    data['utilityPercentage'] = utilityPercentage;
    data['referenceId'] = referenceId;
    data['thumbImage'] = thumbImage;
    data['imageImage'] = imageImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['sets'] = sets;
    if (exerciseMainMuscleGroups != null) {
      data['ExerciseMainMuscleGroups'] =
          exerciseMainMuscleGroups!.toJson();
    }
    return data;
  }
}

class ExerciseMainMuscleGroups {
  String? id;
  String? exerciseId;
  String? muscleGroupId;
  String? createdAt;
  String? updatedAt;

  ExerciseMainMuscleGroups(
      {this.id,
        this.exerciseId,
        this.muscleGroupId,
        this.createdAt,
        this.updatedAt});

  ExerciseMainMuscleGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exerciseId = json['exerciseId'];
    muscleGroupId = json['muscleGroupId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exerciseId'] = exerciseId;
    data['muscleGroupId'] = muscleGroupId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class SecondaryMuscles {
  String? id;
  String? description;
  bool? isAccessoryMuscle;
  bool? isCore;
  bool? isFront;
  bool? isPull;
  bool? isPush;
  bool? isUpperBody;
  String? name;
  double? utilityPercentage;
  String? referenceId;
  String? thumbImage;
  String? imageImage;
  String? createdAt;
  String? updatedAt;
  ExerciseMainMuscleGroups? exerciseSecondaryMuscleGroups;

  SecondaryMuscles(
      {this.id,
        this.description,
        this.isAccessoryMuscle,
        this.isCore,
        this.isFront,
        this.isPull,
        this.isPush,
        this.isUpperBody,
        this.name,
        this.utilityPercentage,
        this.referenceId,
        this.thumbImage,
        this.imageImage,
        this.createdAt,
        this.updatedAt,
        this.exerciseSecondaryMuscleGroups});

  SecondaryMuscles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    isAccessoryMuscle = json['isAccessoryMuscle'];
    isCore = json['isCore'];
    isFront = json['isFront'];
    isPull = json['isPull'];
    isPush = json['isPush'];
    isUpperBody = json['isUpperBody'];
    name = json['name'];
    utilityPercentage = double.parse(json['utilityPercentage'].toString());
    referenceId = json['referenceId'];
    thumbImage = json['thumbImage'];
    imageImage = json['imageImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    exerciseSecondaryMuscleGroups =
    json['ExerciseSecondaryMuscleGroups'] != null
        ? ExerciseMainMuscleGroups.fromJson(
        json['ExerciseSecondaryMuscleGroups'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['isAccessoryMuscle'] = isAccessoryMuscle;
    data['isCore'] = isCore;
    data['isFront'] = isFront;
    data['isPull'] = isPull;
    data['isPush'] = isPush;
    data['isUpperBody'] = isUpperBody;
    data['name'] = name;
    data['utilityPercentage'] = utilityPercentage;
    data['referenceId'] = referenceId;
    data['thumbImage'] = thumbImage;
    data['imageImage'] = imageImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (exerciseSecondaryMuscleGroups != null) {
      data['ExerciseSecondaryMuscleGroups'] =
          exerciseSecondaryMuscleGroups!.toJson();
    }
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? referenceId;
  String? thumbImage;
  String? createdAt;
  String? updatedAt;
  ExerciseExerciseCategories? exerciseExerciseCategories;

  Categories(
      {this.id,
        this.name,
        this.referenceId,
        this.thumbImage,
        this.createdAt,
        this.updatedAt,
        this.exerciseExerciseCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    referenceId = json['referenceId'];
    thumbImage = json['thumbImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    exerciseExerciseCategories = json['ExerciseExerciseCategories'] != null
        ? ExerciseExerciseCategories.fromJson(
        json['ExerciseExerciseCategories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['referenceId'] = referenceId;
    data['thumbImage'] = thumbImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (exerciseExerciseCategories != null) {
      data['ExerciseExerciseCategories'] =
          exerciseExerciseCategories!.toJson();
    }
    return data;
  }
}

class ExerciseExerciseCategories {
  String? id;
  String? exerciseId;
  String? exerciseCategoryId;
  String? createdAt;
  String? updatedAt;

  ExerciseExerciseCategories(
      {this.id,
        this.exerciseId,
        this.exerciseCategoryId,
        this.createdAt,
        this.updatedAt});

  ExerciseExerciseCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exerciseId = json['exerciseId'];
    exerciseCategoryId = json['exerciseCategoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exerciseId'] = exerciseId;
    data['exerciseCategoryId'] = exerciseCategoryId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
