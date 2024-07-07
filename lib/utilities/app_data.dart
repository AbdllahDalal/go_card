import 'package:dream_store_app/models/location_modle.dart';
import 'package:flutter/material.dart';

import '../models/card_prodect_modle.dart';
import '../models/category_modle.dart';
import '../models/message_ai_modle.dart';
import '../models/order_modle.dart';
import '../models/prodect_modle.dart';

// all the image from unsplash.com
List<Category> categories = [
  Category(
      id: 0,
      categoryName: "Watchs",
      categoryImage:
          "https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Category(
      id: 1,
      categoryName: "HeadPhones",
      categoryImage:
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Category(
      id: 2,
      categoryName: "SmartPhones",
      categoryImage:
          "https://images.unsplash.com/photo-1574675904801-eb2cca16af12?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Category(
      id: 3,
      categoryName: "Shoes",
      categoryImage:
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Category(
      id: 4,
      categoryName: "T-Shirt",
      categoryImage:
          "https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
];

List<Prodect> prodects = [
  Prodect(
      id: 0,
      name: "Boys Watch",
      image: [
        "https://images.unsplash.com/photo-1573261821759-fdd1b36d9ca5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWVucyUyMHdhdGNofGVufDB8fDB8fHww",
        "https://images.unsplash.com/photo-1602024305864-8a1a2e5fd90d?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWVucyUyMHdhdGNoZXN8ZW58MHx8MHx8fDA%3D",
        "https://images.unsplash.com/photo-1607776905497-b4f788205f6a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bHV4dXJ5JTIwd2F0Y2hlc3xlbnwwfHwwfHx8MA%3D%3D",
        "https://images.unsplash.com/photo-1619225379807-e9002c44c462?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bHV4dXJ5JTIwd2F0Y2hlc3xlbnwwfHwwfHx8MA%3D%3D",
      ],
      discreption: "Boys' Sports Bracelet Black Smart Watch",
      price: 27,
      colors: [const Color(0xFFFFB619), Colors.black, const Color(0xFFE9E7E7)],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 1,
      name: "Headphone A",
      image: [
        "https://images.unsplash.com/photo-1652383918023-9a365a45d4a8?q=80&w=1664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1624978960894-bed9218acd39?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmxhY2slMjBoZWFkcGhvbmVzfGVufDB8fDB8fHww",
        "https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBpbmslMjBoZWFkcGhvbmVzfGVufDB8fDB8fHww",
        "https://plus.unsplash.com/premium_photo-1679913796054-fc4e44f35b40?q=80&w=1684&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      discreption: "headphone A ",
      price: 27,
      colors: [
        Colors.red,
        const Color(0xFF000000),
        const Color(0xFFFF8EB3),
        const Color(0xFF75FF79)
      ],
      specifications: {},
      categoryId: 1),
  Prodect(
      id: 2,
      name: "female watch and accessories0",
      image: [
        "https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d29tZW5zJTIwd2F0Y2h8ZW58MHx8MHx8fDA%3D",
        "https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d2F0Y2h8ZW58MHx8MHx8fDA%3D",
      ],
      discreption: "female watch and accessories ",
      price: 27,
      colors: [Colors.white, Colors.black],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 3,
      name: "shoes A",
      image: [
        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVkJTIwc3BvcnQlMjBzaG9lc3xlbnwwfHwwfHx8MA%3D%3D",
        "https://images.unsplash.com/photo-1460353581641-37baddab0fa2?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHx8",
        "https://images.unsplash.com/photo-1543508282-5c1f427f023f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8",
        "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D",
      ],
      discreption: "shoes A ",
      price: 27,
      colors: [
        const Color(0xFFF55247),
        const Color(0xFFBEBEBE),
        const Color(0xFF4DE4E4),
        Colors.black,
        const Color(0xFFC2532A)
      ],
      specifications: {
        "Size": [
          "US 6",
          "US 7",
          "US 8",
          "US 9",
        ],
      },
      categoryId: 3),
  Prodect(
      id: 4,
      name: "men watch and accessories",
      image: [
        "https://images.unsplash.com/photo-1623998021450-85c29c644e0d?q=80&w=1857&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHx8",
        "https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fHw%3D",
      ],
      discreption: "men watch and accessories ",
      price: 27,
      colors: [Colors.black, const Color(0xFF994020), const Color(0xFFD65C30)],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 5,
      name: "T-Shirt A",
      image: [
        "https://images.unsplash.com/photo-1620799139507-2a76f79a2f4d?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHdoaXRlJTIwdCUyMHNoaXJ0fGVufDB8fDB8fHww",
      ],
      discreption: "T-Shirt A ",
      price: 27,
      colors: [
        Colors.white,
      ],
      specifications: {
        "Size": [
          "US 6",
          "US 7",
          "US 8",
          "US 9",
        ],
      },
      categoryId: 4),
  Prodect(
      id: 6,
      name: "men watch A",
      image: [
        "https://images.unsplash.com/photo-1623998021446-45cd9b269056?q=80&w=1758&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D",
        "https://images.unsplash.com/photo-1700471299386-7a84be5cd423?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHx8",
      ],
      discreption: "men watch A ",
      price: 27,
      colors: [
        Colors.black,
        const Color(0xFFCA4312),
        const Color(0xFF12558B),
      ],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 7,
      name: "headphone B",
      image: [
        "https://images.unsplash.com/photo-1484704849700-f032a568e944?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D"
            "https://plus.unsplash.com/premium_photo-1679513691485-711d030f7e94?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGFuayUyMGhlYWRwaG9uZXN8ZW58MHx8MHx8fDA%3D",
        "https://images.unsplash.com/photo-1585034127553-bb899555a453?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      discreption: "headphone B ",
      price: 27,
      colors: [
        const Color(0xFFDF3D02),
        Colors.white,
        Colors.black,
      ],
      specifications: {},
      categoryId: 1),
  Prodect(
      id: 8,
      name: "shoes B",
      image: [
        "https://images.unsplash.com/photo-1545289414-1c3cb1c06238?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fHw%3D",
        "https://images.unsplash.com/photo-1608231387042-66d1773070a5?q=80&w=1674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      discreption: "shoes B ",
      price: 27,
      colors: [Colors.black, const Color(0xFFFFF59D)],
      specifications: {
        "Size": [
          "US 6",
          "US 7",
          "US 8",
          "US 9",
        ],
      },
      categoryId: 3),
  Prodect(
      id: 9,
      name: "shoes C",
      image: [
        "https://images.unsplash.com/photo-1600269452121-4f2416e55c28?q=80&w=1665&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1628253747716-0c4f5c90fdda?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHx8",
      ],
      discreption: "shoes C ",
      price: 27,
      colors: [Colors.white, const Color(0xFF12558B)],
      specifications: {
        "Size": [
          "US 6",
          "US 7",
          "US 8",
          "US 9",
        ],
      },
      categoryId: 3),
  Prodect(
      id: 10,
      name: "men watch B",
      image: [
        "https://images.unsplash.com/photo-1602024305864-8a1a2e5fd90d?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWVucyUyMHdhdGNoZXN8ZW58MHx8MHx8fDA%3D",
      ],
      discreption: "men watch B ",
      price: 27,
      colors: [Colors.black],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 11,
      name: "men watch  C",
      image: [
        "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?q=80&w=1894&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      discreption: "men watch  C ",
      price: 27,
      colors: [
        const Color(0xFF772000),
        Colors.black,
      ],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 12,
      name: "shoes D",
      image: [
        "https://images.unsplash.com/photo-1605348532760-6753d2c43329?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1611510338559-2f463335092c?q=80&w=1664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D,"
      ],
      discreption: "shoes D ",
      price: 27,
      colors: [
        Colors.black,
        Colors.grey,
      ],
      specifications: {
        "Size": [
          "US 6",
          "US 7",
          "US 8",
          "US 9",
        ],
      },
      categoryId: 3),
  Prodect(
      id: 13,
      name: "Boys' Sports Bracelet Smart Watch A",
      image: [
        "https://images.unsplash.com/photo-1638450566735-ead9df13ef3f?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1681147547346-2d73c90988d8?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      discreption: "Boys' Sports Bracelet Smart Watch A ",
      price: 27,
      colors: [Colors.black, const Color(0xFFF82E2E), const Color(0xFFC4DCE7)],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 13,
      name: "smart Watch A",
      image: [
        "https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1638450566735-ead9df13ef3f?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      discreption: "smart Watch A ",
      price: 27,
      colors: [
        Colors.white,
        Colors.black,
      ],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 14,
      name: "Boys' Sports Bracelet Smart Watch B",
      image: [
        "https://images.unsplash.com/photo-1637160151663-a410315e4e75?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEwfHx8ZW58MHx8fHx8",
        "https://images.unsplash.com/photo-1640096153022-51258f5d483c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8",
        "https://images.unsplash.com/photo-1638450566739-48b5aac64d94?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHx8",
      ],
      discreption: "Boys' Sports Bracelet Smart Watch B ",
      price: 27,
      colors: [
        Colors.black,
      ],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 15,
      name: "T-Shirt B",
      image: [
        "https://images.unsplash.com/photo-1618354691321-e851c56960d1?q=80&w=1615&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1618354691551-44de113f0164?q=80&w=1615&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHx8",
      ],
      discreption: "T-Shirt B ",
      price: 27,
      colors: [Colors.black26, Colors.black, Colors.white],
      specifications: {},
      categoryId: 4),
  Prodect(
      id: 16,
      name: "female watch",
      image: [
        "https://images.unsplash.com/photo-1585123334904-845d60e97b29?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHx8",
      ],
      discreption: "female watch ",
      price: 27,
      colors: [
        const Color(0xFF4DCFF0),
      ],
      specifications: {},
      categoryId: 0),
  Prodect(
      id: 17,
      name: "men watch and accessories B",
      image: [
        "https://images.unsplash.com/photo-1548171916-c0dea7f94ca6?q=80&w=1630&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      discreption: "men watch and accessories B ",
      price: 27,
      colors: [
        Colors.white,
      ],
      specifications: {},
      categoryId: 0),
];

// List<CardProdect> cardprodects = [];
List<MessageAI> messages = [
  MessageAI(
      id: 0,
      isAi: false,
      text: "I want good watch to waer with my black suit",
      prodects: []),
  MessageAI(
      id: 1,
      isAi: true,
      text:
          "There are a lot of options of watchs that will look great with a black suit",
      prodects: [
        prodects[0],
        prodects[4],
        prodects[6],
      ])
];

List<LocationModle> locations = [];

List<CardProdect> prod = [
  CardProdect(
      id: 0,
      prodect: prodects[6],
      colorIndex: 0,
      image: prodects[6].image[0],
      quantity: 3,
      specifications: prodects[6]
          .specifications
          .map((key, value) => MapEntry(key, value[0]))),
  CardProdect(
      id: 1,
      prodect: prodects[2],
      colorIndex: 1,
      image: prodects[2].image[1],
      quantity: 2,
      specifications: prodects[2]
          .specifications
          .map((key, value) => MapEntry(key, value[0]))),
];
List<String> deliveryStatusList = [
  'All Delivery',
  'Order Placed',
  'Confirmed',
  'On Delivery',
  'Delivered'
];
List<String> paymentStatusList = ['All Payments', 'Paid', 'Unpaid'];
List<Order> orders = [
  Order(
      id: "20220428-06353357",
      date: "03-07-2022",
      paymentStatus: paymentStatusList[1],
      deliveryStatus: deliveryStatusList[1],
      amount: 56.00,
      prodects: prod),
  Order(
      id: "20220428-06353357",
      date: "03-07-2022",
      paymentStatus: paymentStatusList[2],
      deliveryStatus: deliveryStatusList[2],
      amount: 125.00,
      prodects: prod),
  Order(
      id: "20220428-06353357",
      date: "03-07-2022",
      paymentStatus: paymentStatusList[1],
      deliveryStatus: deliveryStatusList[3],
      amount: 56.00,
      prodects: prod),
  Order(
      id: "20220428-06353357",
      date: "03-07-2022",
      paymentStatus: paymentStatusList[2],
      deliveryStatus: deliveryStatusList[4],
      amount: 560.00,
      prodects: prod),
];
