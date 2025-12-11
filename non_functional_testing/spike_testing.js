import http from "k6/http";
import { check, sleep } from "k6";

export const options = {
  stages: [
    { duration: "10s", target: 50 },
    { duration: "1m", target: 100 },
    { duration: "30s", target: 100 },
    { duration: "10s", target: 0 },
  ],
};

const base_url = "http://localhost/tr_auction/tr_pw/tr_pw-main/TR/frontend/";

export default function () {
  const res = http.get(`${base_url}/view-page-barang-user.php`);

  check(res, {
    "Status 200": (r) => r.status === 200,
    "Tidak timeout": (r) => r.timings.duration < 3000,
  });

  sleep(1);
}
