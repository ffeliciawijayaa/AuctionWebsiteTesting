import http from "k6/http";
import { group, sleep } from "k6";

export const options = {
  stages: [
    { duration: "10s", target: 50 },
    { duration: "30s", target: 200 },
    { duration: "10s", target: 200 },
    { duration: "10s", target: 0 },
  ],
  thresholds: {
    http_req_failed: ["rate<0.05"],
    http_req_duration: ["p(95)<5000"],
  },
};

const base_url = "http://localhost/tr_auction/tr_pw/tr_pw-main/TR/frontend/";

export default function () {
  group("Dashboard", function () {
    http.get(`${base_url}/view-page-barang-user.php`);
  });
  sleep(1);

  group("Detail", function () {
    http.get(`${base_url}/view-page-detail-barang.php?id=42`);
  });
  sleep(1);

  group("Login", function () {
    http.get(`${base_url}/view-form-login.php`);
  });
  sleep(1);
}
