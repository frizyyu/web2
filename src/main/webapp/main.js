import Validate from './validate.js';

const validator = new Validate();

document.getElementById('send-btn').addEventListener('click', function(event) {
    event.preventDefault();
    const x = document.querySelector('input[type="checkbox"]:checked');
    const y = document.querySelector('#coord-y');

    const buttons = document.querySelectorAll('button[id^="r"]');
    let r = NaN;
    buttons.forEach(btn => {
        if (btn.disabled)
            r = btn.textContent;
    });
    const check = validator.check(x, y, r);
    if (check.allOk) {
        const coords = validator.getCoords();
        send(coords.x, coords.y, coords.r, "form");
    }
    else {
        logErr(check.log);
    }
});

document.getElementById('graph').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById("hide-elements").open = false;
    const target = this.getBoundingClientRect();
    const x = event.clientX - target.left;
    const y = event.clientY - target.top;
    const buttons = document.querySelectorAll('button[id^="r"]');
    let r = NaN;
    buttons.forEach(btn => {
        if (btn.disabled)
            r = btn.textContent;
    });
    if (!validator.checkR(r)){
        logErr("Укажите R");
    }
    else {
        send((x - 300) * (r / 200), (300 - y) * (r / 200), r, "click");
    }
});

function buttonOnClick(event){
    event.preventDefault();
    const buttons = document.querySelectorAll('button[id^="r"]');
    buttons.forEach(btn => btn.disabled = false);
    event.target.disabled = true;
    loadData();
}

['r1', 'r1.5', 'r2', 'r2.5', 'r3'].forEach(btnId =>
    document.getElementById(btnId).addEventListener('click', (event) => buttonOnClick(event)));

function send(x, y, r, inpType){
    /*
    const data = new URLSearchParams();
    data.append('x', x);
    data.append('y', y);
    data.append('r', r);

    fetch(`controller`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: data.toString()
        })
     */
    const data = {
        inpType: inpType,
        x: x,
        y: y,
        r: r
    };
    fetch(`controller`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
        .then(response => {
            if (!response.ok) {
                return  response.text().then(errorText => {
                    const text = errorText.match(/<body>(.*)<\/body>/i)[1];
                    if (text.includes("COORDS"))
                        throw new Error("Проверьте корректность координат");
                    else
                        throw new Error(text);
                });
            }
            return response.text();
        })
        .then(function (answer) {
            const container = document.getElementById("container");
            container.innerHTML = answer;
        })
        .catch(error => {
            alert(`${error.message}`)
        })
}
function logErr(text){
    document.getElementById("input-log").innerText = text;
    document.getElementById("dot").setAttribute("fill-opacity", "0");
    document.getElementById("dot").setAttribute("stroke-opacity", "0");
}

function drawPoint(x, y, r, isHit) {
    let color = "red";
    if (isHit === "Да")
        color = "green";
    const svg = document.getElementById('graph');
    const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
    circle.setAttribute("cx", 300 + x * (200 / r));
    circle.setAttribute("cy", 300 - y * (200 / r));
    circle.setAttribute("r", 5);
    circle.setAttribute("fill", color);
    svg.appendChild(circle);
}
function clearPoints() {
    const svg = document.getElementById('graph');
    const circles = svg.querySelectorAll('circle');
    circles.forEach(circle => svg.removeChild(circle));
}
function loadData(){
    clearPoints();
    const table = document.getElementById("res-table");
    const rows = table.getElementsByTagName('tr');
    const buttons = document.querySelectorAll('button[id^="r"]');
    let r = NaN;
    buttons.forEach(btn => {
        if (btn.disabled)
            r = btn.textContent;
    });
    if (!validator.checkR(r)){
        logErr("Укажите R");
    }
    else {
        document.getElementById("input-log").innerText = "";
        for (let i = 0; i < rows.length; i++) {
            const row = rows[i];
            const cells = row.getElementsByTagName('td');
            if (cells.length !== 0) {
                drawPoint(cells[1].textContent, cells[2].textContent, r, cells[0].textContent);
            }
        }
    }
}

window.onload = loadData();