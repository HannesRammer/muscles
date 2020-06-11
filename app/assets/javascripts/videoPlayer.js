let global_max_exercise = 0;
let global_current_exercise = 0;
let current_duration = 0;
let current_reps = 0;
let unit = "";
let max_reps = 0, max_duration = 0;
let pause = false;

function video_ended() {

    if (!pause) {
        if (unit === "reps") {
            current_reps += 1;
            console.log("current_reps" + current_reps);
            $("#reps")[0].value = current_reps;
            console.log("current_duration" + current_duration);
            if (current_reps <= max_reps) {
                play_video();
            } else {
                if (global_max_exercise > global_current_exercise) {
                    global_current_exercise += 1;
                    select_exercise(global_current_exercise);

                }

            }
        } else {
            current_duration += parseInt($("video")[0].duration);
            $("#duration")[0].value = current_duration;
            console.log("current_reps" + current_reps);
            console.log("current_duration" + current_duration);
            if (current_duration <= max_duration) {
                play_video();
            } else {
                if (global_max_exercise > global_current_exercise) {
                    global_current_exercise += 1;
                    select_exercise(global_current_exercise);

                }

            }
        }
    }
    console.log("rep done");
}


function start_training() {

    if (pause === true) {
        pause = false;
        play_video();
    } else {
        global_current_exercise = 0;
        select_exercise(global_current_exercise);
    }

}

function pause_training() {
    pause = true;
    show_play_button();

}

function continue_training() {


}

function set_unit() {
    let unit_rep = $("#unit_reps")[0];
    if (unit_rep !== undefined && unit_rep.checked) {
        unit = "reps";
    } else {
        unit = "duration";
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
    links = $(".exercise_selection_link ");
    links[current_exercise].click();

    setTimeout(init_max_and_current, 3000);


}

function init_max_and_current() {
    let rep = $("#reps")[0];
    if( rep !== undefined){
        max_reps = rep.max - 1;
    }
    current_reps = 0;
    let dur = $("#duration")[0];
    if( dur !== undefined){
        max_duration = dur.max - 1;
    }

    current_duration = 0;
    set_unit();
    start_exercise();
    global_max_exercise = $(".exercise_selection_link ").length - 1;
}
