/*let vp = {
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

*/