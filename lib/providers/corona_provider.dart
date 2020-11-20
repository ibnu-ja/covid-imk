import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'indonesia_model.dart';
import 'world_model.dart';

class CoronaProvider with ChangeNotifier {
  IndonesiaModel summary; //STATE UNTUK MENAMPUNG DATA DI INDONESIA
  WorldModel world; //STATE UNTUK MENAMPUNG DATA DUNIA
  String updated; //STATE UNTUK MENAMPUNG WAKTU PEMBAHARUAN

  //FUNGSI INI AKAN MENJALANKAN API CALL UNTUK MENGAMBIL DATA
  Future<void> getData() async {
    //BAGIAN PERTAMA ADALAH UNTUK MENGAMBIL DATA DARI INDONESIA
    final url = 'https://api.covid19api.com/summary';
    final response = await http.get(url); //HIT KE API
    //DAN CONVERT DATA YANG DITERIMA
    final result = json.decode(response.body) as Map<String, dynamic>;
    final res = json.decode(response.body) as Map<String, dynamic>;
    //print(result['Global']['NewConfirme']);
    //LALU MASUKKAN KE DALAM STATE SUMMARY DENGAN FORMAT BERDASARKAN INDONESIAMODEL
    print(result['Countries'][77]['Country']);
    summary = IndonesiaModel(
      newconfirmed: result['Countries'][77]['NewConfirmed'],
      totalconfirmed: result['Countries'][77]['TotalConfirmed'],
      newrecovered: result['Countries'][77]['NewRecovered'],
      totalrecovered: result['Countries'][77]['TotalRecovered'],
      newdeaths: result['Countries'][77]['NewDeaths'],
      totaldeaths: result['Countries'][77]['TotalDeaths'],
    );
    //SIMPAN DATA PEMBAHARUAN KE DALAM STATE UPDATED

    updated = "Terbaru";

    // //ADAPUN DATA DUNIA MEMILIKI 3 BUAH API, DAN MASING-MASING MENGHASILKAN DATANYA SENDIRI.
    // //ADAPUN PENJELASANNYA SAMA DENGAN PENJELASAN SEBELUMNYA
    // final worldPositive = 'https://api.kawalcorona.com/positif/';
    // final responsePositive = await http.get(worldPositive);
    // final resultPositive = json.decode(responsePositive.body);

    // final worldRecovered = 'https://api.kawalcorona.com/sembuh/';
    // final responseRecovered = await http.get(worldRecovered);
    // final resultRecovered = json.decode(responseRecovered.body);

    // final worldDeaths = 'https://api.kawalcorona.com/meninggal/';
    // final responseDeaths = await http.get(worldDeaths);
    // final resultDeaths = json.decode(responseDeaths.body);
    print(res['Global']['NewConfirmed']);
    world = WorldModel(
      newconfirmed: (res['Global']['NewConfirmed']).toString(),
      totalconfirmed: (res['Global']['TotalConfirmed'].toString()),
      newrecovered: (res['Global']['NewRecovered'].toString()),
      totalrecovered: (res['Global']['TotalRecovered'].toString()),
      newdeaths: (res['Global']['NewDeaths'].toString()),
      totaldeaths: (res['Global']['TotalDeaths']).toString(),
    );
    notifyListeners(); //INFORMASIKAN BAHWA TERJADI PERUBAHAN STATE AGAR WIDGET DIRENDER ULANG
  }
}
