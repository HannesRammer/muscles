// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//


//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


////= require jquery


function toggleClass(elem, className1, className2) {
    elem.className = (elem.className === className1) ? className2 : className1;
}

function setClass(elem, className1) {
    elem.className = className1;
}


function toggleTraining() {
    let a = $("#user_selected");
    a.toggleClass("hide");
    a.toggleClass("show");
    let b = $("#hide_training");
    b.toggleClass("hide");
    b.toggleClass("show");
    let c = $("#open_training");
    c.toggleClass("hide");
    c.toggleClass("show");
}

function change_style() {
    drop_down = document.style_form.style_options;
    color = drop_down.options[drop_down.selectedIndex].value;
    setClass(document.querySelector("body"), "theme_" + color);

    let exp = new Date();
    let numdays = 7;
    exp.setTime(exp.getTime() + (1000 * 60 * 60 * 24 * numdays));
    document.cookie = "style=" + color + "; path=/; expires=" + exp.toGMTString();

}

function back_style() {
    new_style("-");
}

function next_style() {
    new_style("+");
}

function new_style(x) {

    let drop_down = document.style_form.style_options;
    let new_index, color;
    if (x === "+") {
        new_index = drop_down.selectedIndex + 1;
    } else if (x === "-") {
        new_index = drop_down.selectedIndex - 1;
    }
    if (new_index >= 0 && drop_down.options[new_index]) {

    } else {
        if (x === "+") {
            new_index = 0;
        } else if (x === "-") {
            new_index = drop_down.length - 1;
        }
    }
    color = drop_down.options[new_index].value;
    drop_down.selectedIndex = new_index;
    setClass(document.querySelector("body"), "theme_" + color);

    var exp = new Date();
    var numdays = 7;
    exp.setTime(exp.getTime() + (1000 * 60 * 60 * 24 * numdays));
    document.cookie = "style=" + color + "; path=/; expires=" + exp.toGMTString();

}


function set_level(percent, id, way) {             //called
    if (way === "down") {
        document.querySelector("#" + id + "_e").style.height = (100 - percent) + "px";
        document.querySelector("#" + id + "_f").style.height = percent + "px";
    }
    if (way === "left") {
        document.querySelector("#" + id + "_f").style.width = (100 - percent) + "px";

    }
}

//set_level id to 100%
function full(id) {               //inject
    set_level(100, id, "left");
}

function fill(id, perc) {               //inject
    set_level(perc, id, "left");
}

//calles set_level function with max val and current val
function drown_to_null(counter_max, counter, id) {             //called
    var percent = ((100 / counter_max) * counter);
    if (percent > 0) {
        set_level(percent, id, "left")
    }
}

function set_timeline(counter_max, counter) {             //called
    var usertime_percent = ((100 / counter_max) * counter);
    duration = document.querySelector("#htmlPlayer").duration;
    x = (duration / 100) * usertime_percent;
    document.querySelector("#htmlPlayer").currentTime = duration - x;
    document.querySelector("#vid").value = (duration - x) / 60;

}


/*---*/
function hover(name) {
    setClass(document.querySelector("#hover"), "" + cleanName(name) + "_hover");
    let last_hover = document.querySelector("#muscle_text_hover").value;
    if (name === "") {
        //$("muscle_hover").innerHTML = "";//
        if (last_hover !== "" && document.querySelector("#" + last_hover + "_hover")) {
            setClass(document.querySelector("#" + last_hover + "_hover"), "hidden_muscle_pic");
        }
    } else {
        let p = cleanName(name);
        let s = p.toLowerCase();

        if (last_hover !== "" && document.querySelector("#" + last_hover + "_hover")) {
            setClass(document.querySelector("#" + last_hover + "_hover"), "hidden_muscle_pic");
        }
        if (document.querySelector("#" + s + "_hover")) {
            setClass(document.querySelector("#" + s + "_hover"), "multi_pic");
        }

        document.querySelector("#muscle_text_hover").innerHTML = name;
    }
}


function cleanName(name) {
    return name.gsub("ß", "ss").gsub(" ", "_").gsub("ä", "ae").gsub("ö", "oe").gsub("ü", "ue").gsub("Ä", "ae").gsub("Ö", "oe").gsub("Ü", "ue").toLowerCase();
}


function selected(urlString) {

    $.ajax({
        type: "POST",
        url: urlString,
        dataType: "script",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        }
    });
    return false;
}

function getMuscleType() {
    let muscleType = "primary";
    if (document.querySelector("#muscletype_Sekund_rmuskel").checked) {
        muscleType = "secondary";
    }
    return muscleType;
}

function toggleMuscleToExercise(urlString) {
    let muscleType = getMuscleType();


    $.ajax({
        type: "POST",
        url: urlString + muscleType,
        dataType: "script",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        }
    });
    return false;
}

function setExerciseActive(trainingsplanPosition) {
    var exerciseContainer = document.querySelector("#trainings_exercises_text");
    // Get all buttons with class="btn" inside the container
    var exercises = exerciseContainer.querySelectorAll(".trainingsplans_exercises_text");

// Loop through the buttons and add the active class to the current/clicked button
    for (var i = 0; i < exercises.length; i++) {

        if (i === trainingsplanPosition) {
            $(exercises[i]).addClass("active_exercise");
        } else {
            $(exercises[i]).removeClass("active_exercise");
        }

    }
}

function scale_for_landscape() {

    let currentWidth = document.documentElement.clientWidth;
    let currentHeight = document.documentElement.clientHeight;
    $("#body_tag").css("width", "1859px");
    $("#body_tag").css("transform", "scale(" + (currentWidth / 1900) + ")");


    if ($(".user_text_vertical")[0]) {
        $(".user_text_vertical").addClass("user_text_horizontal");
        $(".user_text_vertical").removeClass("user_text_vertical");
    }
    if ($(".grid_child_vertical")[0]) {

        $(".grid_child_vertical").addClass("grid_child_horizontal");
        $(".grid_child_vertical").removeClass("grid_child_vertical");

    }

    let left = $("#body_tag").position().left;
    let top = $("#body_tag").position().top;

    $(".dropdown_icons").css("display", "none");

    $("body").css("left", 0 - left);
    $("body").css("top", 0 - top);

}

function remove_scale() {

    if ($(".user_text_horizontal")[0]) {
        $(".user_text_horizontal").addClass("user_text_vertical");
        $(".user_text_horizontal").removeClass("user_text_horizontal");
    }
    if ($(".grid_child_horizontal")[0]) {
        $(".grid_child_horizontal").addClass("grid_child_vertical");
        $(".grid_child_horizontal").removeClass("grid_child_horizontal");
    }

    $("#body_tag").css("width", "");
    $("#body_tag").css("transform", "");
    if (parseInt($(".blue_background.trainingsplan_grid.grid_child_vertical").css("height"))<100) {
        $("#trainingsplan_down").css("display", "block");
        $("#trainingsplan_up").css("display", "none");
    } else {
        $("#trainingsplan_down").css("display", "none");
        $("#trainingsplan_up").css("display", "block");
    }

    if (parseInt($(".grid_child3.red_background.exercise_grid").css("height"))<100) {
        $("#exercise_down").css("display", "block");
        $("#exercise_up").css("display", "none");
    } else {
        $("#exercise_down").css("display", "none");
        $("#exercise_up").css("display", "block");
    }
    if (parseInt($(".grid_child_horizontal.yellow_background.exercises_grid").css("height"))<100) {
        $("#exercises_down").css("display", "block");
        $("#exercises_up").css("display", "none");
    } else {
        $("#exercises_down").css("display", "none");
        $("#exercises_up").css("display", "block");
    }

    $("body").css("left", 0);
    $("body").css("top", 0);
}

function to_scale_or_not_to_scale() {
    if (window.innerHeight > window.innerWidth) {
        console.log("resize for horizontal view");
        remove_scale();
    } else {
        console.log("remove scale for vertical");
        scale_for_landscape();
    }
}

function set_exercise_unit(e_id, unit) {
    document.querySelector("#exercise_" + e_id + "_unit").setAttribute("value", unit);

}


function video_ended() {
    let current_reps = parseInt($("#current_reps")[0].value);
    let current_duration = parseInt($("#current_duration")[0].value);

    let max_reps = parseInt($("#max_reps")[0].value);
    let max_duration = parseInt($("#max_duration")[0].value);
    let pause = $("#pause_status")[0].value;
    let unit = $("#unit")[0].value;
    let global_current_exercise = parseInt($("#global_current_exercise")[0].value);
    let global_max_exercise = parseInt($("#global_max_exercise")[0].value);
    let myVar = $("#myVar")[0].value;

    if (pause === "false") {
        if (unit === "reps") {
            current_reps = current_reps + 1;
            $("#current_reps")[0].value = current_reps;
            console.log("current_reps" + current_reps);
            $("#reps")[0].value = current_reps;
            $("#reps_current")[0].innerHTML = current_reps;
            if (current_reps <= max_reps) {
                play_video();
            } else {
                if (global_max_exercise > global_current_exercise) {
                    let pause_div = $("#pause_div").css("display", "block");
                    let play_div = $("#play_div").css("display", "none");
                    $("#myVar")[0].value = setInterval(myTimer, 1000);

                }

            }
        } else {/*duration*/
            current_duration = current_duration + parseInt($("video")[0].duration);
            $("#current_duration")[0].value = current_duration;
            $("#duration")[0].value = current_duration;
            $("#dur_current")[0].innerHTML = current_duration;
            console.log("current_duration" + current_duration);
            if (current_duration <= max_duration) {
                play_video();
            } else {
                if (global_max_exercise > global_current_exercise) {
                    let pause_div = $("#pause_div").css("display", "block");
                    let play_div = $("#play_div").css("display", "none");
                    $("#myVar")[0].value = setInterval(myTimer, 1000);
                }

            }
        }
    }
    console.log("rep done");
}


function start_training() {
    $("#training_started")[0].value = "true";
    let pause = $("#pause_status")[0];
    if (pause.value === "true") {
        $("#pause_status")[0].value = false;
        play_video();
    } else {
        select_exercise(0);
    }

}

function pause_training() {
    $("#pause_status")[0].value = "true";
    show_play_button();
    $("#training_started")[0].value = "false"

}

/*function continue_training() {


}*/

function set_unit() {
    let unit_rep = $("#unit_reps")[0];


    if (unit_rep !== undefined) {
        $("#unit")[0].value = "reps";
    } else {
        $("#unit")[0].value = "duration";
    }
}

function start_exercise() {
    play_video();

}

function hide_play_button() {
    $("#start_exercise").css("display", "none");
    $("#pause_exercise").css("display", "block");

}

function show_play_button() {
    $("#start_exercise").css("display", "block");
    $("#pause_exercise").css("display", "none");

}

function play_video() {
    hide_play_button();
    $("video")[0].play();
}

function select_exercise(current_exercise) {
    let links = $(".exercise_selection_link ");
    links[current_exercise].click();

    // setTimeout(init_max_and_current, 3000);
}

function autoCallInitOnVidLoadIfTrainingStarted() {
    if ($("#training_started")[0] && $("#training_started")[0].value === "true") {
        init_max_and_current();
    }


}

function init_max_and_current() {
    if ($("#reps")[0] && $("#reps")[0].value === -3 || $("#duration")[0] && $("#duration")[0].value === -6) {

        let rep = $("#reps")[0];

        if (rep !== undefined) {
            $("#max_reps")[0].value = rep.max - 1;
        }
        $("#current_reps")[0].value = -3;

        let dur = $("#duration")[0];
        if (dur !== undefined) {
            $("#max_duration")[0].value = dur.max - 1;
        }
        $("#current_duration")[0].value = -6;

        let pause = $("#pause")[0];
        if (pause !== undefined) {
            $("#max_pause")[0].value = pause.max - 1;
        }
        $("#current_pause")[0].value = 0;

        set_unit();
        start_exercise();
        $("#global_max_exercise")[0].value = $(".exercise_selection_link ").length - 1;
    }

}


function myTimer() {
    let current_pause = parseInt($("#current_pause")[0].value);
    let max_pause = parseInt($("#max_pause")[0].value);
    let global_current_exercise = parseInt($("#global_current_exercise")[0].value);


    /*let d = new Date();*/
    if (current_pause === max_pause) {
        current_pause = 0;
        myStopFunction();
        global_current_exercise += 1;
        $("#global_current_exercise")[0].value = global_current_exercise;
        select_exercise(global_current_exercise);
    } else {
        current_pause++;
        $("#current_pause")[0].value = current_pause
        $("#pause")[0].value = current_pause;
        $("#pause_current")[0].innerHTML = current_pause;
    }
}

function myStopFunction() {
    let myVar = $("#myVar")[0].value;

    clearInterval(myVar);
    let pause_div = $("#pause_div").css("display", "none");
    let play_div = $("#play_div").css("display", "block");

}


let ui_render = {
    show_filter: function () {
        $("#search_filter").css("height", "100%");
        $("#search_filter_down").css("display", "none");
        $("#search_filter_up").css("display", "block");
    },
    hide_filter: function () {
        $("#search_filter").css("height", "0");
        $("#search_filter_up").css("display", "none");
        $("#search_filter_down").css("display", "block");

    },
    show_trainingsplan: function () {
        $(".blue_background.trainingsplan_grid.grid_child_vertical").css("height", "18rem");
        $("#trainingsplan_down").css("display", "none");
        $("#trainingsplan_up").css("display", "block");

    },
    hide_trainingsplan: function () {

        $(".blue_background.trainingsplan_grid.grid_child_vertical").css("height", "3rem");
        $("#trainingsplan_up").css("display", "none");
        $("#trainingsplan_down").css("display", "block");

    },
    show_exercise: function () {
        $(".grid_child3.red_background.exercise_grid").css("height", "18rem");
        $("#exercise_down").css("display", "none");
        $("#exercise_up").css("display", "block");

    },
    hide_exercise: function () {

        $(".grid_child3.red_background.exercise_grid").css("height", "3rem");
        $("#exercise_up").css("display", "none");
        $("#exercise_down").css("display", "block");

    },
    show_exercises: function () {
        $(".grid_child_horizontal.yellow_background.exercises_grid").css("height", "18rem");
        $("#exercises_down").css("display", "none");
        $("#exercises_up").css("display", "block");

    },
    hide_exercises: function () {

        $(".grid_child_horizontal.yellow_background.exercises_grid").css("height", "3rem");
        $("#exercises_up").css("display", "none");
        $("#exercises_down").css("display", "block");

    },
};
