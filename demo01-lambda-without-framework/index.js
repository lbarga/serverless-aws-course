async function handler(event, context) {
  console.log("Enviroment...", JSON.stringify(process.env, null, 2));
  console.log("Event...", JSON.stringify(event, null, 2));

  return {
    foo: "barr",
  };
}

module.exports = {
  handler,
};
