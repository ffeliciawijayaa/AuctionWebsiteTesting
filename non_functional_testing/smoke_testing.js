import http from "k6/http";
import { group, sleep } from "k6";

export const options = {
  vus: 1,
  duration: "30s",
};

const base_url = "http://localhost/tr_auction/tr_pw/tr_pw-main/TR/frontend/";

export default function () {
  group("smoke_user", function () {
    http.get(`${base_url}/view-page-barang-user.php`);
    sleep(1);
    http.get(`${base_url}/view-page-detail-barang.php?id=42`);
    sleep(1);
    http.get(`${base_url}/view-form-login.php`);
  });
}
