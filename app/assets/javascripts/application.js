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
    if (document.querySelector(".hidden_training")) {
        let a = $(".hidden_training");
        a.toggleClass("hidden_training");
        a.toggleClass("show_training");
        $(document.querySelector("#open_training")).hide();
        $(document.querySelector("#close_training")).show();
    } else if (document.querySelector(".show_training")) {
        let a = $(".show_training");
        a.toggleClass("hidden_training");
        a.toggleClass("show_training");
        $(document.querySelector("#open_training")).show();
        $(document.querySelector("#close_training")).hide();
    }
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

function toggle_tab(id) {
    let factor = id.split("_")[0];

    let primary = document.querySelector("#" + factor + "_primary");
    let secondary = document.querySelector("#" + factor + "_secondary");

    let primaryTab = document.querySelector("#" + factor + "_primary_tab");
    let secondaryTab = document.querySelector("#" + factor + "_secondary_tab");
    if (id === (factor + "_primary")) {
        primary.classList.toggle("hide");
        primaryTab.classList.toggle("activeTab");

    } else if (id === (factor + "_secondary")) {
        secondary.classList.toggle("hide");
        secondaryTab.classList.toggle("activeTab");
    }
    /* else if (id == (factor + "_antagonist")) {
     document.querySelector(factor + "_antagonist").style.display = "block";
     setClass(document.querySelector(factor + "_antagonist_tab"), document.querySelector(factor + "_antagonist_tab").className.gsub("underline", ""));

     }   */
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

function toggle_running(elem) {
    if (elem.value === "false") {
        elem.value = "true";
        document.querySelector("#pause_training").innerHTML = "<b>pause training</b>";
    } else {
        elem.value = "false";
        document.querySelector("#pause_training").innerHTML = "<b>resume training</b>";
    }


}

function startExercise(i) {
    document.querySelector("#running").value = "true";
    document.querySelector("#allow_pause").value = "true";
    document.querySelector("#start_training").innerHTML = "";
    /*document.querySelector("pause_training").innerHTML = "<b>pause training</b>";*/
    reps = document.querySelector("#reps").value;
    single_rep = document.querySelector("#single_rep").value * 1000;
    perc = 100;
    set_level(perc, "reps_div", "left");
    set_level(perc, "single_rep_div", "left");
    set_level(0, "pause_div", "left");
    do_rep(single_rep, single_rep, reps, reps, i);
}

function do_rep(single_rep, counter, reps, new_reps, i) {

    if (counter > 0) {

        if (document.querySelector("#hold_div_f").innerHTML === 0) {
            drown_to_null(single_rep, counter, "single_rep_div");
            //set_timeline(single_rep, counter) ;
            document.querySelector("#single_rep_div_f").innerHTML = (counter / 1000);

            if (counter > (single_rep / 2)) {
                extention = ".jpg";
                do_it = "push it!!";
            } else if (counter === (single_rep / 2)) {
                hold = document.querySelector("#hold").value * 1000;
                extention = "1.jpg";
                document.querySelector("#hold_div_f").innerHTML = hold;
                do_it = "Halten";
            } else if (counter < (single_rep / 2)) {
                extention = "1.jpg";
                do_it = "release";
            }
            document.querySelector("#training_pic").src = "/images/exercises/" + trainingsArray[i] + extention;

            document.querySelector("#training_text").innerHTML = do_it;

            counter = counter - 100;
            setTimeout("do_rep(" + single_rep + "," + counter + "," + reps + "," + new_reps + "," + i + ")", 100);
        } else {
            hold_on(hold, hold, single_rep, counter, reps, new_reps, i);
        }
    } else {
        fill("single_rep_div", 0);
        document.querySelector("#single_rep_div_f").innerHTML = 0;
        new_reps = new_reps - 1;
        if (new_reps > 0) {
            drown_to_null(reps, new_reps, "reps_div");
            document.querySelector("#reps_div_f").innerHTML = new_reps;
            full("single_rep_div");
            do_rep(single_rep, single_rep, reps, new_reps, i);
        } else {
            fill("reps_div", 0);
            document.querySelector("#reps_div_f").innerHTML = 0;

            i = i + 1;
            if (i < trainingsArray.length) {
                pause = document.querySelector("#pause").value * 1000;
                pause_c(pause, pause, i)
            } else {
                document.querySelector("#running").value = "false";
                document.querySelector("#allow_pause").value = "false";
                document.querySelector("#start_training").innerHTML = "<b>start</b>";
                /*document.querySelector("#pause_training").innerHTML = "";*/
            }
        }


    }


}

function pause_for(milliseconds) {
    var dt = new Date();
    while (new Date() - dt <= milliseconds) { /* Do nothing */
    }
}


function pause_c(x, y, i) {
    document.querySelector("#training_text").innerHTML = "noch " + (x / 1000) + " s pause";
    if (x > 0) {
        x = x - 100;
        drown_to_null(y, x, "pause_div");
        setTimeout("pause_c(" + x + "," + y + "," + i + ")", 100);
    } else {
        startExercise(i);
    }
}

function hold_on(max, counter, single_rep, counter_1, reps, new_reps, i) {
    document.querySelector("#training_text").innerHTML = "noch " + (counter / 1000) + " s halten";
    if (counter > 0) {
        counter = counter - 100;
        drown_to_null(max, counter, "hold_div");
        document.querySelector("#hold_div_f").innerHTML = counter;
        setTimeout("hold_on(" + max + "," + counter + "," + single_rep + "," + counter_1 + "," + reps + "," + new_reps + "," + i + ")", 100);
    } else {
        fill("hold_div", 0);
        do_rep(single_rep, counter_1, reps, new_reps, i);
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

function set_training(r, s, h, p) {
    document.querySelector("#reps").value = r;
    document.querySelector("#single_rep").value = s;
    document.querySelector("#hold").value = h;
    document.querySelector("#pause").value = p;

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
            setClass(document.querySelector("#" + last_hover + "_hover"), "hidden_muscle_tirpic");
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


function selected(name) {
    let urlString = ""
    if (document.location.href.indexOf("muscles") > -1) {
        urlString = "/muscles/main/muscle/";
    } else {
        urlString = "/main/muscle/";
    }

    $.ajax({
        type: "POST",
        url: urlString + name,
        dataType: "script",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        }
    });
    return false;
}

function toggleMuscleToExercise(eid, name) {
    let muscleType = "primary";
    if (document.querySelector("#muscletype_Sekund_rmuskel").checked) {
        muscleType = "secondary";
    }
    let urlString = ""
    if (document.location.href.indexOf("muscles") > -1) {
        urlString = "/muscles/main/exercise/";
    } else {
        urlString = "/main/exercise/";
    }

    $.ajax({
        type: "POST",
        url: urlString + eid + "/" + muscleType + "/muscle/" + name,
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

function resize_trainingsplans_exercise_video() {

    if ($("#exercise_video_show video").length === 1) {
        let ex = $("#exercise_video_show");
        let video = $("video");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
        //ex.width(width);
        video.css("maxWidth", width);
    }
    if ($("#trainingsplans_exercise_video_show video").length === 1) {
        let ex = $("#trainingsplans_exercise_video_show");
        let video = $("video");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
        //ex.width(width);
        video.css("maxWidth", width);
    }
    if ($("#exercises_show video").length === 1) {
        let ex = $("#exercise");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
//ex.width(width);
        ex.css("maxWidth", width);
    }
    if ($("#exercise_video_show video").length === 1) {
        let ex = $("#exercise_video_show video");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
//ex.width(width);
        ex.css("maxWidth", width);
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

    if (pause === "false")  {
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
                    $("#myVar")[0].value = setInterval(myTimer, 1000);

                }

            }
        } else {
            current_duration = current_duration + parseInt($("video")[0].duration);
            $("#current_duration")[0].value = current_duration;
            $("#duration")[0].value = current_duration;
            $("#dur_current")[0].innerHTML = current_duration;
            console.log("current_duration" + current_duration);
            if (current_duration <= max_duration) {
                play_video();
            } else {
                if (global_max_exercise > global_current_exercise) {
                    $("#myVar")[0].value = setInterval(myTimer, 1000);
                }

            }
        }
    }
    console.log("rep done");
}


function start_training() {
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

    setTimeout(init_max_and_current, 3000);
}

function init_max_and_current() {
    let rep = $("#reps")[0];

    if (rep !== undefined) {
        $("#max_reps")[0].value = rep.max - 1;
    }
    $("#current_reps")[0].value = 0;

    let dur = $("#duration")[0];
    if (dur !== undefined) {
        $("#max_duration")[0].value = dur.max - 1;
    }
    $("#current_duration")[0].value = 0;

    let pause_div = $("#pause")[0];
    if (pause_div !== undefined) {
        $("#max_pause")[0].value = pause_div.max - 1;
    }
    $("#current_pause")[0].value = 0;

    set_unit();
    start_exercise();
    $("#global_max_exercise")[0].value = $(".exercise_selection_link ").length - 1;
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
}
