const db = require("./firebase");
const { processResidentsCsv } = require("./utils");
const fs = require("fs");

const createSocietyViaCsv = async (residents, societyDetails) => {
  var { address, city, name, pinCode, sector, state, town } = societyDetails;
  var { id } = await db.collection("/societies").add({
    address,
    city,
    name,
    pinCode,
    sector,
    state,
    town
  });
  var flats = processResidentsCsv(residents);
  Object.keys(flats).forEach(async flatName => {
    var flatObject = { residents: flats[flatName] };
    // flatObject[`${flatName}`] = flats[flatName];
    await db
      .collection(`/societies/${id}/flats`)
      .doc(`${flatName}`)
      .set(flatObject);
  });
  //   await db.collection(`/societies/${id}/guards`);
  console.log("yes");
};

// const addMaid = async(maidDetails,society)=>{
//     var {aadhar,mobile,name}=maidDetails;
//     db.collection(`societies/${society}/regularVisitors`).add({})
// }

fs.readFile("residents.csv", { encoding: "utf8" }, (err, data) => {
  var societyDetails = {
    address: "test",
    city: "test",
    name: "test",
    pinCode: "test",
    sector: "test",
    state: "test",
    town: "test"
  };
  createSocietyViaCsv(data, societyDetails);
});
