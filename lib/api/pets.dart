import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:super_paws/models/pet.dart';

Future<List<Pet>> getAllPets() async {
  http.Response response = await http
      .get(Uri.parse("http://super-paws-backend.vercel.app/api/pets/app"));
  List<Pet> pets = [];
  var decoded = jsonDecode(response.body);
  for (var pet in decoded["result"]) {
    pets.add(Pet.fromJson(pet));
  }

  return pets;
}
