
const { onRequest } = require("firebase-functions/v2/https");

exports.healthCheck = onRequest(
  {
    region: "europe-west1",
    cors: false,
  },
  (req, res) => {
    if (req.method !== "GET") {
      res.set("Allow", "GET");
      return res.status(405).json({
        ok: false,
        error: "Method not allowed",
      });
    }

    return res.status(200).json({
      ok: true,
      service: "Platinum School Backend",
      status: "running",
    });
  }
);
