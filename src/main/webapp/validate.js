export default class Validate
{
    x;
    y;
    r;
    constructor() {
        this.log = "";
    }
    check(x, y, r) {
        this.log = "";
        if (!this.checkForNull(x, y, r))
            return {
                allOk: false,
                log: "Заполните все поля формы"
            };
        return {
            allOk: this.checkX(x) && this.checkY(y) && this.checkR(r),
            log: this.log
        };
    }
    checkForNull(x, y, r){
        if (x && y && r)
            return true;
        else
            return false;
    }
    checkX(x){
        x = parseFloat(x.value);
        this.x = x;
        if ([-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2].includes(x))
            return true;
        else {
            this.log = "X нужно выбрать"
            return false;
        }
    }

    checkY(y) {
        if (!/^(-?\d+(\.\d+)?)$/.test(y.value)){
            this.log = "Y должен содержать число"
            return false;
        }
        y = parseFloat(y.value);
        this.y = y;
        if (isNaN(y)) {
            this.log = "Y должен содержать число"
            return false;
        }
        if (-5 <= y && y <= 3)
            return true;
        else {
            this.log = "Значение Y должно быть от -3 до 5"
            return false;
        }
    }

    checkR(r) {
        r = parseFloat(r);
        this.r = r;
        if (isNaN(r)) {
            this.log = "R нужно выбрать"
            return false;
        }
        return true;
    }

    getCoords(){
        return{
            x: this.x,
            y: this.y,
            r: this.r
        };
    }
}