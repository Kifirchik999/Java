$(document).ready(function () {
    $('#form-lab1').validate({
        rules: {
            y: {
                required: true,
                number: true,
                min: -5,
                max: 3
            },
            x: {
                required: true,
                number: true,
                min: -5,
                max: 5
            },
            radius: {
                required: true
            }
        },
        messages: {
            y: {
                required: "Поле не может быть пустым!",
                number: "Введите числовое значение",
                min: "Введите значение от -5 до 3",
                max: "Введите значение от -5 до 3"
            },
            x   : {
                required: "Поле не может быть пустым!",
                number: "Введите числовое значение",
                min: "Введите значение от -5 до 5",
                max: "Введите значение от -5 до 5"
            },
            radius: {
                required: "Поле не может быть пустым!"
            }
        }
    });
});
