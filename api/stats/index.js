module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    const name = "webapp"
    context.res = {
        // status: 200, /* Defaults to 200 */
        body: {
            message: name
        }
    };
}