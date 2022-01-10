package com.dvt.controllers.admin;

public class MgsUtil {
    public static String mgsShow(String object, String code) {
        String mgs = "";
        switch (code) {
            case "addSus":
                mgs = "Thêm " + object + " thành công !!!";
                break;
            case "updateSus":
                mgs = "Cập nhật " + object + " thành công !!!";
                break;
            case "deleteSus":
                mgs = "Xóa " + object + " thành công !!!";
                break;
            case "err":
                mgs = "Thao tác thất bại !!!";
                break;
        }
        return mgs;
    }
}
