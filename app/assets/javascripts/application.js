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


//= require jquery-3.5.1.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .




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
    $("body").addClass("horizontal");
    $("body").removeClass("vertical");

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
    $("body").removeClass("horizontal");
    $("body").addClass("vertical");

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
    if (parseInt($(".blue_background.trainingsplan_grid.grid_child_vertical").css("height")) <= 100) {
        $("#trainingsplan_down").css("display", "block");
        $("#trainingsplan_up").css("display", "none");
    } else {
        $("#trainingsplan_down").css("display", "none");
        $("#trainingsplan_up").css("display", "block");
    }

    if (parseInt($(".grid_child3.red_background.exercise_grid").css("height")) <= 100) {
        $("#exercise_down").css("display", "block");
        $("#exercise_up").css("display", "none");
    } else {
        $("#exercise_down").css("display", "none");
        $("#exercise_up").css("display", "block");
    }
    if (parseInt($(".yellow_background.exercises_grid.grid_child_vertical").css("height")) <= 100) {
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
    if (mobileCheck()) {
        console.log("mobile");
        $("body").addClass("small_screen");
        $("body").removeClass("big_screen");
    } else {
        console.log("not mobile");
        $("body").removeClass("small_screen");
        $("body").addClass("big_screen");
    }
    if (document.querySelector(".grid_parent") !== null) {
        if (window.innerHeight > window.innerWidth) {
            console.log("resize for horizontal view");
            remove_scale();
        } else {
            console.log("remove scale for vertical");
            scale_for_landscape();
        }
    } else {
        console.log("scale, not grid");
        scale_for_landscape();
    }
}

function set_exercise_unit(e_id, unit) {
    document.querySelector("#exercise_" + e_id + "_unit").setAttribute("value", unit);

}

/*video player*/
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
        $(".blue_background.trainingsplan_grid.grid_child_vertical").css("height", "25rem");
        $("#trainingsplan_down").css("display", "none");
        $("#trainingsplan_up").css("display", "block");

    },
    hide_trainingsplan: function () {

        $(".blue_background.trainingsplan_grid.grid_child_vertical").css("height", "5rem");
        $("#trainingsplan_up").css("display", "none");
        $("#trainingsplan_down").css("display", "block");

    },
    show_exercise: function () {
        $(".grid_child3.red_background.exercise_grid").css("height", "45rem");
        $("#exercise_down").css("display", "none");
        $("#exercise_up").css("display", "block");

    },
    hide_exercise: function () {

        $(".grid_child3.red_background.exercise_grid").css("height", "5rem");
        $("#exercise_up").css("display", "none");
        $("#exercise_down").css("display", "block");

    },
    show_exercises: function () {
        $(".grid_child_vertical.yellow_background.exercises_grid").css("height", "25rem");
        $("#exercises_down").css("display", "none");
        $("#exercises_up").css("display", "block");

    },
    hide_exercises: function () {
        $(".grid_child_vertical.yellow_background.exercises_grid").css("height", "5rem");
        $("#exercises_up").css("display", "none");
        $("#exercises_down").css("display", "block");

    },
};

function mobileAndTabletCheck() {
    let check = false;
    (function (a) {
        if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true;
    })(navigator.userAgent || navigator.vendor || window.opera);
    return check;
};

function mobileCheck() {
    let check = false;
    (function (a) {
        if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true;
    })(navigator.userAgent || navigator.vendor || window.opera);
    return check;
};
