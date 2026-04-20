db = db.getSiblingDB("blog_db");

db.createCollection("posts", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["titre", "auteur", "vues"],
      properties: {
        titre: { bsonType: "string" },
        auteur: { bsonType: "string" },
        vues: { bsonType: "int" },
      },
    },
  },
});

db.posts.insertMany([
  {
    titre: "Luffy devient le Roi des Pirates",
    auteur: "Luffy",
    vues: NumberInt(9999),
  },
  { titre: "Deuxième article", auteur: "Nami", vues: NumberInt(25) },
  { titre: "Troisième article", auteur: "Sanji", vues: NumberInt(5) },
  { titre: "Quatrième article", auteur: "Chopper", vues: NumberInt(100) },
  { titre: "Cinquième article", auteur: "Zoro", vues: NumberInt(42) },
]);
