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
        let a= $(".hidden_training");
        a.toggleClass("hidden_training");
        a.toggleClass("show_training");
        $(document.querySelector("#open_training")).hide();
        $(document.querySelector("#close_training")).show();
    } else if (document.querySelector(".show_training")) {
        let a= $(".show_training");
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
    if (document.location.href.indexOf("muscles") > -1 ){
        urlString ="/muscles/main/muscle/";
    }else{
        urlString ="/main/muscle/";
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
    if (document.location.href.indexOf("muscles") > -1 ){
        urlString ="/muscles/main/exercise/";
    }else{
        urlString ="/main/exercise/";
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

function resize_trainingsplans_exercise_video(){

    if($("#exercise_video_show video").length === 1){
        let ex = $("#exercise_video_show");
        let video = $("video");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
        //ex.width(width);
        video.css( "maxWidth",width);
    }
    if($("#trainingsplans_exercise_video_show video").length === 1){
        let ex = $("#trainingsplans_exercise_video_show");
        let video = $("video");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
        //ex.width(width);
        video.css( "maxWidth",width);
    }
    if($("#exercises_show video").length === 1){
        let ex = $("#exercise");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
//ex.width(width);
        ex.css( "maxWidth",width);
    }
    if($("#exercise_video_show video").length === 1){
        let ex = $("#exercise_video_show video");
        let left = ex.offset()["left"];
        let maxWidth = $("#container").width();
        let width = maxWidth - left - 50;
//ex.width(width);
        ex.css( "maxWidth",width);
    }
}

function set_exercise_unit(e_id, unit) {
    document.querySelector("#exercise_" + e_id + "_unit").setAttribute("value", unit);

}

let vp = {
    global_max_exercise: 0,
    global_current_exercise: 0,
    current_duration: 0,
    current_reps: 0,
    current_pause: 0,
    unit: "",
    max_reps: 0, max_duration: 0, max_pause: 0,
    myVar: 0,
    video_ended: function () {
        let pause = $("#pause_status")[0];
        if (pause.value === "false") {
            if (vp.unit === "reps") {
                vp.current_reps += 1;
                console.log("current_reps" + vp.current_reps);
                $("#reps")[0].value = vp.current_reps;
                $("#reps_current")[0].innerHTML = vp.current_reps;
                console.log("current_duration" + vp.current_duration);
                if (vp.current_reps <= vp.max_reps) {
                    vp.play_video();
                } else {
                    if (vp.global_max_exercise > vp.global_current_exercise) {
                        vp.myVar = setInterval(vp.myTimer, 1000);

                    }

                }
            } else {
                vp.current_duration += parseInt($("video")[0].duration);
                $("#duration")[0].value = vp.current_duration;
                $("#dur_current")[0].innerHTML = vp.current_duration;
                console.log("current_reps" + vp.current_reps);
                console.log("current_duration" + vp.current_duration);
                if (vp.current_duration <= vp.max_duration) {
                    vp.play_video();
                } else {
                    if (vp.global_max_exercise > vp.global_current_exercise) {
                        vp.myVar = setInterval(vp.myTimer, 1000);
                    }

                }
            }
        }
        console.log("rep done");
    },


    start_training: function () {
        let pause = $("#pause_status")[0];
        if (pause.value === "true") {
            pause.value = false;
            vp.play_video();
        } else {
            vp.global_current_exercise = 0;
            vp.select_exercise(vp.global_current_exercise);
        }

    },

    pause_training: function () {
        $("#pause_status")[0].value = "true";
        vp.show_play_button();

    },

    set_unit: function () {
        let unit_rep = $("#unit_reps")[0];
        if (unit_rep !== undefined) {
            vp.unit = "reps";
        } else {
            vp.unit = "duration";
        }
    },

    start_exercise: function () {
        vp.play_video();

    },

    hide_play_button: function () {
        $("#start_exercise").css("display", "none");
        $("#pause_exercise").css("display", "block");

    },

    show_play_button: function () {
        $("#start_exercise").css("display", "block");
        $("#pause_exercise").css("display", "none");

    },

    play_video: function () {
        vp.hide_play_button();
        $("video")[0].play();
    },

    select_exercise: function (current_exercise) {
        let links = $(".exercise_selection_link ");
        links[current_exercise].click();

        setTimeout(vp.init_max_and_current, 3000);
    },

    init_max_and_current: function () {
        let rep = $("#reps")[0];
        if (rep !== undefined) {
            vp.max_reps = rep.max - 1;
        }
        vp.current_reps = 0;

        let dur = $("#duration")[0];
        if (dur !== undefined) {
            vp.max_duration = dur.max - 1;
        }
        vp.current_duration = 0;

        let pause_div = $("#pause")[0];
        if (pause_div !== undefined) {
            vp.max_pause = pause_div.max - 1;
        }
        vp.current_pause = 0;

        vp.set_unit();
        vp.start_exercise();
        vp.global_max_exercise = $(".exercise_selection_link ").length - 1;
    },


    myTimer: function () {
        if (vp.current_pause === vp.max_pause) {
            vp.current_pause = 0;
            vp.myStopFunction();
            vp.global_current_exercise += 1;
            vp.select_exercise(vp.global_current_exercise);
        } else {
            vp.current_pause++;
            $("#pause")[0].value = vp.current_pause;
            $("#pause_current")[0].innerHTML = vp.current_pause;
        }
    },

    myStopFunction: function () {
        clearInterval(vp.myVar);
    }
}
