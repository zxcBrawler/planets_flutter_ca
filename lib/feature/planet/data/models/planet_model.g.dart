// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanetModelAdapter extends TypeAdapter<PlanetModel> {
  @override
  final int typeId = 0;

  @override
  PlanetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    // ignore: unused_local_variable
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlanetModel();
  }

  @override
  void write(BinaryWriter writer, PlanetModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
