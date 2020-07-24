class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :login_required #, :except => [:index, :muscle, :body_part, :exercise, :hide_exercise, :search_string, :impressum]
  before_action :admin_required
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all

    require 'json'

    @json = JSON.parse({'5' => {'name' => 'Advanced Right Lizard'}}.to_json)

    @hash = {
        5=> {
            "name"=> "Advanced Right Lizard",
            "primary"=> "Hip Flexors,Adductors",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1922-advanced-right-lizard-how-to-do-exercise"
        },
        6=> {
            "name"=> "Buddy Split Stretches",
            "primary"=> "Front Shoulders,Hip Flexors,Adductors,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Stretching,Partner,",
            "url"=> "https://www.skimble.com/exercises/2124-buddy-split-stretches-how-to-do-exercise"
        },
        7=> {
            "name"=> "Alternating Fire Hydrants",
            "primary"=> "Transverse Abdominis,Adductors,Abductors",
            "secondary"=> "Glute Max,Hip Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1877-alternating-fire-hydrants-how-to-do-exercise"
        },
        8=> {
            "name"=> "Awkward Pose",
            "primary"=> "Adductors,Quads,Calves",
            "secondary"=> "Side Shoulders,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2269-awkward-pose-how-to-do-exercise"
        },
        9=> {
            "name"=> "Alternating Lateral Lunges with Kettlebell",
            "primary"=> "Glute Max,Adductors,Quads,Abductors",
            "secondary"=> "Transverse Abdominis,Hamstrings",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2166-alternating-lateral-lunges-with-kettlebell-how-to-do-exercise"
        },
        10=> {
            "name"=> "Butterfly",
            "primary"=> "Hip Flexors,Adductors,Abductors",
            "secondary"=> "Lower Back",
            "tags"=> "Exercise Mat,Yoga,Pilates",
            "url"=> "https://www.skimble.com/exercises/1641-butterfly-how-to-do-exercise"
        },
        11=> {
            "name"=> "Butterfly with Leg Extension",
            "primary"=> "Hip Flexors,Adductors,Hamstrings,Abductors",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis,Glute Max,Hip Flexors,Lower Back",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1589-butterfly-with-leg-extension-how-to-do-exercise"
        },
        12=> {
            "name"=> "Butterfly with Heel Tap",
            "primary"=> "Hip Flexors,Adductors,Abductors",
            "secondary"=> "Upper Abs,Lower Abs,Glute Max,Lower Back",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1590-butterfly-with-heel-tap-how-to-do-exercise"
        },
        13=> {
            "name"=> "Clock Lunges",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2148-clock-lunges-how-to-do-exercise"
        },
        14=> {
            "name"=> "Clams",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1240-clams-how-to-do-exercise"
        },
        15=> {
            "name"=> "Center Leg Stretch",
            "primary"=> "Traps,Lats,Adductors",
            "secondary"=> "Glute Max,Hamstrings,Rhomboids,Neck Flexors",
            "tags"=> "Exercise Mat,Warmup,Cooldown,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/936-center-leg-stretch-how-to-do-exercise"
        },
        16=> {
            "name"=> "Curtsy Lunge",
            "primary"=> "Glute Max,Adductors,Quads,Calves,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2401-curtsy-lunge-how-to-do-exercise"
        },
        17=> {
            "name"=> "Cross Leg Sit-Ups",
            "primary"=> "Upper Abs,Lower Abs,Adductors,Abductors",
            "secondary"=> "Side Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2136-cross-leg-sit-ups-how-to-do-exercise"
        },
        18=> {
            "name"=> "Duck Walk",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves",
            "secondary"=> "Hip Flexors,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/903-duck-walk-how-to-do-exercise"
        },
        19=> {
            "name"=> "Dragon Squats",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Balance,",
            "url"=> "https://www.skimble.com/exercises/915-dragon-squats-how-to-do-exercise"
        },
        20=> {
            "name"=> "Dumbbell Left Leg Squats",
            "primary"=> "Adductors,Quads,Hamstrings,Calves",
            "secondary"=> "Lower Back",
            "tags"=> "Dumbbells,Home Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/1153-dumbbell-left-leg-squats-how-to-do-exercise"
        },
        21=> {
            "name"=> "Duckunders",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Dance",
            "url"=> "https://www.skimble.com/exercises/1772-duckunders-how-to-do-exercise"
        },
        22=> {
            "name"=> "Dumbbell Sumo Squats",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/802-dumbbell-sumo-squats-how-to-do-exercise"
        },
        23=> {
            "name"=> "Dumbbell Side Lunges with Hammer Curls",
            "primary"=> "Biceps,Glute Max,Adductors,Quads",
            "secondary"=> "Hamstrings,Calves,Elbow Flexors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/800-dumbbell-side-lunges-with-hammer-curls-how-to-do-exercise"
        },
        24=> {
            "name"=> "Dumbbell Side Lunge and Touch",
            "primary"=> "Glute Max,Adductors,Quads",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/670-dumbbell-side-lunge-and-touch-how-to-do-exercise"
        },
        25=> {
            "name"=> "Eagle Pose",
            "primary"=> "Side Shoulders,Rear Shoulders,Glute Max,Adductors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1281-eagle-pose-how-to-do-exercise"
        },
        26=> {
            "name"=> "Foot Taps",
            "primary"=> "Glute Max,Hip Flexors,Adductors",
            "secondary"=> "Quads,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1267-foot-taps-how-to-do-exercise"
        },
        27=> {
            "name"=> "Elbow to Hip Side Thrusts",
            "primary"=> "Hip Flexors,Adductors",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "No Equipment,Dance",
            "url"=> "https://www.skimble.com/exercises/1266-elbow-to-hip-side-thrusts-how-to-do-exercise"
        },
        28=> {
            "name"=> "Garland Pose",
            "primary"=> "Glute Max,Hip Flexors,Adductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1389-garland-pose-how-to-do-exercise"
        },
        29=> {
            "name"=> "Horse Stance",
            "primary"=> "Lower Chest,Hip Flexors,Adductors,Abductors",
            "secondary"=> "Glute Max,Quads,Hamstrings",
            "tags"=> "Exercise Mat,Yoga,Pilates",
            "url"=> "https://www.skimble.com/exercises/1614-horse-stance-how-to-do-exercise"
        },
        30=> {
            "name"=> "Hopping Ice Skaters",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Running,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1429-hopping-ice-skaters-how-to-do-exercise"
        },
        31=> {
            "name"=> "Jump Rope with Lateral Hops",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves,Abductors,Plantar Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Jump Rope,Warmup,Home Equipment,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/1651-jump-rope-with-lateral-hops-how-to-do-exercise"
        },
        32=> {
            "name"=> "Hot Style Chair Pose",
            "primary"=> "Adductors,Quads,Calves",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "Exercise Mat,Yoga,Balance",
            "url"=> "https://www.skimble.com/exercises/1630-hot-style-chair-pose-how-to-do-exercise"
        },
        33=> {
            "name"=> "Horse Stance with Heel Ups",
            "primary"=> "Hip Flexors,Adductors,Quads,Calves,Abductors",
            "secondary"=> "Lower Chest,Glute Max,Hamstrings",
            "tags"=> "Exercise Mat,Yoga,Pilates",
            "url"=> "https://www.skimble.com/exercises/1615-horse-stance-with-heel-ups-how-to-do-exercise"
        },
        34=> {
            "name"=> "Lateral Leg Lifts",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Hip Flexors",
            "tags"=> "Chair,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1100-lateral-leg-lifts-how-to-do-exercise"
        },
        35=> {
            "name"=> "Lateral Step Ups",
            "primary"=> "Glute Max,Adductors,Quads,Calves,Knee Flexors",
            "secondary"=> "Left Obliques,Right Obliques,Hamstrings,Lower Back,Abductors,Back Extensors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2372-lateral-step-ups-how-to-do-exercise"
        },
        36=> {
            "name"=> "Lateral Lunge with Bicep Curl",
            "primary"=> "Biceps,Glute Max,Adductors,Quads",
            "secondary"=> "Supinator,Hamstrings,Lower Back,Abductors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/175-lateral-lunge-with-bicep-curl-how-to-do-exercise"
        },
        37=> {
            "name"=> "Lateral Step Ups with Left Leg Raise",
            "primary"=> "Glute Max,Adductors,Quads,Calves,Abductors,Knee Flexors",
            "secondary"=> "Left Obliques,Right Obliques,Hamstrings,Lower Back,Back Extensors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2373-lateral-step-ups-with-left-leg-raise-how-to-do-exercise"
        },
        38=> {
            "name"=> "Lateral Step with Band",
            "primary"=> "Adductors,Abductors",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2351-lateral-step-with-band-how-to-do-exercise"
        },
        39=> {
            "name"=> "Lateral Step Ups with Right Leg Raise",
            "primary"=> "Glute Max,Adductors,Quads,Calves,Abductors,Knee Flexors",
            "secondary"=> "Left Obliques,Right Obliques,Hamstrings,Lower Back,Back Extensors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2374-lateral-step-ups-with-right-leg-raise-how-to-do-exercise"
        },
        40=> {
            "name"=> "Left Adductor Rolls",
            "primary"=> "Adductors",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1445-left-adductor-rolls-how-to-do-exercise"
        },
        41=> {
            "name"=> "Left Advanced Hip Opening Sequence",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Adductors,Quads,Hamstrings,Calves",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1873-left-advanced-hip-opening-sequence-how-to-do-exercise"
        },
        42=> {
            "name"=> "Left Bird of Paradise",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Hip Flexors,Adductors,Quads",
            "secondary"=> "Triceps,Biceps,Lats,Glute Max,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1398-left-bird-of-paradise-how-to-do-exercise"
        },
        43=> {
            "name"=> "Left Bird of Paradise Sequence",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Wrist Flexors,Upper Chest,Middle Chest,Lower Abs,Left Obliques,Right Obliques,Traps,Glute Max,Adductors,Quads,Hamstrings,Calves,Rhomboids,Neck Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1726-left-bird-of-paradise-sequence-how-to-do-exercise"
        },
        44=> {
            "name"=> "Left Bridge Glute Circles",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1640-left-bridge-glute-circles-how-to-do-exercise"
        },
        45=> {
            "name"=> "Left Bound Side Angle",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Adductors,Quads",
            "secondary"=> "Triceps,Biceps,Middle Chest,Traps,Glute Max,Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1820-left-bound-side-angle-how-to-do-exercise"
        },
        46=> {
            "name"=> "Left Eight-Angle Pose",
            "primary"=> "Triceps,Biceps,Lower Abs,Left Obliques,Right Obliques,Adductors",
            "secondary"=> "Supinator,Wrist Flexors,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/546-left-eight-angle-pose-how-to-do-exercise"
        },
        47=> {
            "name"=> "Left Leg Circles",
            "primary"=> "Hip Flexors,Adductors,Quads,Abductors",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1344-left-leg-circles-how-to-do-exercise"
        },
        48=> {
            "name"=> "Left Half-Bound Side Angle",
            "primary"=> "Front Shoulders,Glute Max,Adductors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1875-left-half-bound-side-angle-how-to-do-exercise"
        },

        49=> {
            "name"=> "Left Half Moon",
            "primary"=> "Adductors,Quads,Hamstrings",
            "secondary"=> "Lower Abs,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1825-left-half-moon-how-to-do-exercise"
        },
        50=> {
            "name"=> "Left Lateral Lunges",
            "primary"=> "Adductors,Quads",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1108-left-lateral-lunges-how-to-do-exercise"
        },
        51=> {
            "name"=> "Left Leg Box Jumps",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves,Abductors,Plantar Flexors",
            "secondary"=> "Required Equipment: Box or Step",
            "tags"=> "Bodyweight,Crossfit,",
            "url"=> "https://www.skimble.com/exercises/2359-left-leg-box-jumps-how-to-do-exercise"
        },
        52=> {
            "name"=> "Left Leg Lifts On A Bench",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Hip Flexors",
            "tags"=> "Box or Step,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1121-left-leg-lifts-on-a-bench-how-to-do-exercise"
        },
        53=> {
            "name"=> "Left Leg Lateral Raise with Band",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Lower Back",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2352-left-leg-lateral-raise-with-band-how-to-do-exercise"
        },
        54=> {
            "name"=> "Left Lizard",
            "primary"=> "Hip Flexors,Adductors,Quads",
            "secondary"=> "Glute Max,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2244-left-lizard-how-to-do-exercise"
        },
        55=> {
            "name"=> "Left Lying Clams",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1242-left-lying-clams-how-to-do-exercise"
        },
        56=> {
            "name"=> "Left Reclined Hand to Big Toe Variation",
            "primary"=> "Adductors,Hamstrings",
            "secondary"=> "Lower Abs,Hip Flexors",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3293-left-reclined-hand-to-big-toe-variation-how-to-do-exercise"
        },
        57=> {
            "name"=> "Left Modified Side Angle",
            "primary"=> "Front Shoulders,Glute Max,Adductors",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1855-left-modified-side-angle-how-to-do-exercise"
        },
        58=> {
            "name"=> "Left Roundhouses",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1206-left-roundhouses-how-to-do-exercise"
        },
        59=> {
            "name"=> "Left Side Angle",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Adductors,Quads",
            "secondary"=> "Side Shoulders,Lower Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1824-left-side-angle-how-to-do-exercise"
        },
        60=> {
            "name"=> "Left Scissors",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Hamstrings",
            "secondary"=> "Triceps,Biceps,Lower Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2065-left-scissors-how-to-do-exercise"
        },
        61=> {
            "name"=> "Left Side Crane",
            "primary"=> "Lower Abs,Lats,Adductors",
            "secondary"=> "Triceps,Biceps,Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1374-left-side-crane-how-to-do-exercise"
        },
        62=> {
            "name"=> "Left Side Plank Rainbows",
            "primary"=> "Transverse Abdominis,Glute Max,Adductors",
            "secondary"=> "Right Obliques,Quads,Abductors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2110-left-side-plank-rainbows-how-to-do-exercise"
        },
        63=> {
            "name"=> "Left Side Ball Raises",
            "primary"=> "Left Obliques,Adductors",
            "secondary"=> "Upper Abs,Lower Abs,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1298-left-side-ball-raises-how-to-do-exercise"
        },
        64=> {
            "name"=> "Left Side Stepping",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves,Abductors",
            "secondary"=> "Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2430-left-side-stepping-how-to-do-exercise"
        },
        65=> {
            "name"=> "Left Side Plank with Leg Abduction",
            "primary"=> "Left Obliques,Glute Max,Adductors,Abductors",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Right Obliques",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2161-left-side-plank-with-leg-abduction-how-to-do-exercise"
        },
        66=> {
            "name"=> "Left Triangle",
            "primary"=> "Traps,Adductors,Hamstrings",
            "secondary"=> "Side Shoulders,Left Obliques,Right Obliques,Rhomboids",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1822-left-triangle-how-to-do-exercise"
        },
        67=> {
            "name"=> "Left Side Treadmill Squats",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2434-left-side-treadmill-squats-how-to-do-exercise"
        },
        68=> {
            "name"=> "Left Side-Reclining Leg Lift",
            "primary"=> "Adductors,Hamstrings",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1617-left-side-reclining-leg-lift-how-to-do-exercise"
        },
        69=> {
            "name"=> "Left Tree",
            "primary"=> "Adductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/805-left-tree-how-to-do-exercise"
        },
        70=> {
            "name"=> "Leg Crossover Stretches",
            "primary"=> "Glute Max,Adductors",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Stretching",
            "url"=> "https://www.skimble.com/exercises/1891-leg-crossover-stretches-how-to-do-exercise"
        },
        71=> {
            "name"=> "Left Warrior 2",
            "primary"=> "Glute Max,Adductors,Quads,Neck Flexors",
            "secondary"=> "Side Shoulders,Transverse Abdominis,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1788-left-warrior-2-how-to-do-exercise"
        },
        72=> {
            "name"=> "Left Twisting Low Lunge",
            "primary"=> "Upper Abs,Glute Max,Adductors",
            "secondary"=> "Left Obliques,Right Obliques,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1892-left-twisting-low-lunge-how-to-do-exercise"
        },
        73=> {
            "name"=> "Lying Left Leg Back Circles",
            "primary"=> "Glute Max,Adductors,Hamstrings,Abductors",
            "secondary"=> "Left Obliques",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1246-lying-left-leg-back-circles-how-to-do-exercise"
        },
        74=> {
            "name"=> "Lying Left Leg Circles",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Abductors",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1245-lying-left-leg-circles-how-to-do-exercise"
        },
        75=> {
            "name"=> "Lying Left Leg Kicks",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Hip Flexors,Quads,Hamstrings",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1250-lying-left-leg-kicks-how-to-do-exercise"
        },
        76=> {
            "name"=> "Lying Right Leg Back Circles",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Hamstrings,Abductors",
            "secondary"=> "Right Obliques",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1247-lying-right-leg-back-circles-how-to-do-exercise"
        },
        77=> {
            "name"=> "Lying Left Leg Lifts",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Left Obliques,Hip Flexors",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1252-lying-left-leg-lifts-how-to-do-exercise"
        },
        78=> {
            "name"=> "Lying Left Leg Stretch",
            "primary"=> "Glute Max,Adductors,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1638-lying-left-leg-stretch-how-to-do-exercise"
        },
        79=> {
            "name"=> "Lying Right Leg Lifts",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Right Obliques,Hip Flexors",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1251-lying-right-leg-lifts-how-to-do-exercise"
        },
        80=> {
            "name"=> "Lying Right Leg Circles",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Abductors",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1244-lying-right-leg-circles-how-to-do-exercise"
        },
        81=> {
            "name"=> "Lying Right Leg Kicks",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Hip Flexors,Quads,Hamstrings",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1249-lying-right-leg-kicks-how-to-do-exercise"
        },
        82=> {
            "name"=> "Lying Right Leg Stretch",
            "primary"=> "Glute Max,Adductors,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1377-lying-right-leg-stretch-how-to-do-exercise"
        },
        83=> {
            "name"=> "Narrow Squat Holds",
            "primary"=> "Glute Max,Adductors,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2015-narrow-squat-holds-how-to-do-exercise"
        },
        84=> {
            "name"=> "Pilates Left Side-Lying Leg Lifts",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1642-pilates-left-side-lying-leg-lifts-how-to-do-exercise"
        },
        85=> {
            "name"=> "Plyo Side Lunges to Touch",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Quads,Hamstrings,Calves,Lower Back",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/2131-plyo-side-lunges-to-touch-how-to-do-exercise"
        },
        86=> {
            "name"=> "Pilates Right Side-Lying Leg Lifts",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1643-pilates-right-side-lying-leg-lifts-how-to-do-exercise"
        },
        87=> {
            "name"=> "Plie Squats with Tip Toes",
            "primary"=> "Adductors,Quads,Hamstrings,Calves",
            "secondary"=> "Glute Max,Hip Flexors,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1151-plie-squats-with-tip-toes-how-to-do-exercise"
        },
        88=> {
            "name"=> "Reclined Butterfly",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors,Adductors",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1853-reclined-butterfly-how-to-do-exercise"
        },
        89=> {
            "name"=> "Reverse Lunge Off Step",
            "primary"=> "Glute Max,Adductors,Quads,Knee Flexors",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2371-reverse-lunge-off-step-how-to-do-exercise"
        },
        90=> {
            "name"=> "Reverse Crunch with Ball",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Adductors",
            "secondary"=> "Hip Flexors,Quads",
            "tags"=> "Stability Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1568-reverse-crunch-with-ball-how-to-do-exercise"
        },
        91=> {
            "name"=> "Right Adductor Rolls",
            "primary"=> "Adductors",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1437-right-adductor-rolls-how-to-do-exercise"
        },
        92=> {
            "name"=> "Right Bird of Paradise",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Hip Flexors,Adductors,Quads",
            "secondary"=> "Triceps,Biceps,Lats,Glute Max,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1724-right-bird-of-paradise-how-to-do-exercise"
        },
        93=> {
            "name"=> "Right Advanced Hip Opening Sequence",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Adductors,Quads,Hamstrings,Calves,Neck Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1713-right-advanced-hip-opening-sequence-how-to-do-exercise"
        },
        94=> {
            "name"=> "Right Bound Side Angle",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Adductors,Quads",
            "secondary"=> "Triceps,Biceps,Middle Chest,Traps,Glute Max,Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1802-right-bound-side-angle-how-to-do-exercise"
        },
        95=> {
            "name"=> "Right Bird of Paradise Sequence",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Wrist Flexors,Upper Chest,Middle Chest,Lower Abs,Left Obliques,Right Obliques,Traps,Glute Max,Adductors,Quads,Hamstrings,Calves,Rhomboids,Neck Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1725-right-bird-of-paradise-sequence-how-to-do-exercise"
        },
        96=> {
            "name"=> "Right Bridge Glute Circles",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Adductors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1639-right-bridge-glute-circles-how-to-do-exercise"
        },
        97=> {
            "name"=> "Right Eight-Angle Pose",
            "primary"=> "Triceps,Biceps,Lower Abs,Left Obliques,Right Obliques,Adductors",
            "secondary"=> "Supinator,Wrist Flexors,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1760-right-eight-angle-pose-how-to-do-exercise"
        },
        98=> {
            "name"=> "Right Half Moon",
            "primary"=> "Adductors,Quads,Hamstrings",
            "secondary"=> "Lower Abs,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1812-right-half-moon-how-to-do-exercise"
        },
        99=> {
            "name"=> "Right Half-Bound Side Angle",
            "primary"=> "Front Shoulders,Glute Max,Adductors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1876-right-half-bound-side-angle-how-to-do-exercise"
        },
        100=> {
            "name"=> "Right Leg Box Jumps",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves,Abductors,Plantar Flexors",
            "secondary"=> "Required Equipment: Box or Step",
            "tags"=> "Bodyweight,Crossfit,",
            "url"=> "https://www.skimble.com/exercises/2360-right-leg-box-jumps-how-to-do-exercise"
        },
        101=> {
            "name"=> "Right Leg Circles",
            "primary"=> "Hip Flexors,Adductors,Quads,Abductors",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1343-right-leg-circles-how-to-do-exercise"
        },
        102=> {
            "name"=> "Right Lateral Lunges",
            "primary"=> "Adductors,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Balance,",
            "url"=> "https://www.skimble.com/exercises/1107-right-lateral-lunges-how-to-do-exercise"
        },
        103=> {
            "name"=> "Right Lizard",
            "primary"=> "Hip Flexors,Adductors,Quads",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1921-right-lizard-how-to-do-exercise"
        },
        104=> {
            "name"=> "Right Leg Lateral Raise with Band",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Lower Back",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2353-right-leg-lateral-raise-with-band-how-to-do-exercise"
        },
        105=> {
            "name"=> "Right Lying Clams",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1241-right-lying-clams-how-to-do-exercise"
        },
        106=> {
            "name"=> "Right Modified Side Angle",
            "primary"=> "Side Shoulders,Glute Max,Adductors",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/615-right-modified-side-angle-how-to-do-exercise"
        },
        107=> {
            "name"=> "Right Roundhouses",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1207-right-roundhouses-how-to-do-exercise"
        },
        108=> {
            "name"=> "Right Side Angle",
            "primary"=> "Right Obliques,Transverse Abdominis,Glute Max,Adductors,Quads",
            "secondary"=> "Side Shoulders",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/896-right-side-angle-how-to-do-exercise"
        },
        109=> {
            "name"=> "Right Ostrich",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max,Hip Flexors,Adductors",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1909-right-ostrich-how-to-do-exercise"
        },
        110=> {
            "name"=> "Right Reclined Hand to Big Toe Variation",
            "primary"=> "Adductors,Hamstrings",
            "secondary"=> "Lower Abs,Hip Flexors",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3292-right-reclined-hand-to-big-toe-variation-how-to-do-exercise"
        },
        111=> {
            "name"=> "Right Side Ball Raises",
            "primary"=> "Right Obliques,Adductors",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1297-right-side-ball-raises-how-to-do-exercise"
        },
        112=> {
            "name"=> "Right Side Crane",
            "primary"=> "Lower Abs,Lats,Adductors",
            "secondary"=> "Triceps,Biceps,Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1597-right-side-crane-how-to-do-exercise"
        },
        113=> {
            "name"=> "Right Side Plank with Leg Abduction",
            "primary"=> "Right Obliques,Glute Max,Adductors,Abductors",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2162-right-side-plank-with-leg-abduction-how-to-do-exercise"
        },
        114=> {
            "name"=> "Right Side Treadmill Squats",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2433-right-side-treadmill-squats-how-to-do-exercise"
        },
        115=> {
            "name"=> "Right Side Stepping",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves,Abductors",
            "secondary"=> "Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2429-right-side-stepping-how-to-do-exercise"
        },
        116=> {
            "name"=> "Right Twisting Low Lunge",
            "primary"=> "Left Obliques,Right Obliques,Adductors",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1893-right-twisting-low-lunge-how-to-do-exercise"
        },
        117=> {
            "name"=> "Right Side-Reclining Leg Lift",
            "primary"=> "Hip Flexors,Adductors,Hamstrings,Abductors",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga,Pilates",
            "url"=> "https://www.skimble.com/exercises/1611-right-side-reclining-leg-lift-how-to-do-exercise"
        },
        118=> {
            "name"=> "Right Triangle",
            "primary"=> "Traps,Adductors,Hamstrings",
            "secondary"=> "Side Shoulders,Left Obliques,Right Obliques,Rhomboids",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/162-right-triangle-how-to-do-exercise"
        },
        119=> {
            "name"=> "Right Tree",
            "primary"=> "Adductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/806-right-tree-how-to-do-exercise"
        },
        120=> {
            "name"=> "Right Warrior 2",
            "primary"=> "Glute Max,Adductors,Quads,Neck Flexors",
            "secondary"=> "Side Shoulders,Transverse Abdominis,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1787-right-warrior-2-how-to-do-exercise"
        },
        121=> {
            "name"=> "Right Twisting Scissors",
            "primary"=> "Triceps,Biceps,Upper Abs,Left Obliques,Right Obliques,Glute Max,Adductors,Hamstrings",
            "secondary"=> "Lats",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1947-right-twisting-scissors-how-to-do-exercise"
        },
        122=> {
            "name"=> "Roll Overs",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Glute Max,Adductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1753-roll-overs-how-to-do-exercise"
        },
        123=> {
            "name"=> "Scissor Cross Crunches",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors,Adductors,Lower Back,Abductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2111-scissor-cross-crunches-how-to-do-exercise"
        },
        124=> {
            "name"=> "Roundhouses",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Calves",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1198-roundhouses-how-to-do-exercise"
        },
        125=> {
            "name"=> "Same Angle Pose",
            "primary"=> "Hip Flexors,Adductors,Hamstrings",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1903-same-angle-pose-how-to-do-exercise"
        },
        126=> {
            "name"=> "Shoulder Stands with Ball",
            "primary"=> "Upper Abs,Lower Abs,Adductors",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Home Equipment,",
            "url"=> "https://www.skimble.com/exercises/1626-shoulder-stands-with-ball-how-to-do-exercise"
        },
        127=> {
            "name"=> "Shoulderstand",
            "primary"=> "Traps,Lats,Adductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1392-shoulderstand-how-to-do-exercise"
        },
        128=> {
            "name"=> "Seated Wide Angle",
            "primary"=> "Glute Max,Adductors,Hamstrings,Neck Flexors",
            "secondary"=> "Lats",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1285-seated-wide-angle-how-to-do-exercise"
        },
        129=> {
            "name"=> "Side Squats",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1126-side-squats-how-to-do-exercise"
        },
        130=> {
            "name"=> "Side Cross Kicks",
            "primary"=> "Side Shoulders,Glute Max,Hip Flexors,Adductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/105-side-cross-kicks-how-to-do-exercise"
        },
        131=> {
            "name"=> "Side Lunges",
            "primary"=> "Glute Max,Adductors,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/964-side-lunges-how-to-do-exercise"
        },
        132=> {
            "name"=> "Side Steps on Stairs",
            "primary"=> "Glute Max,Adductors,Quads,Abductors",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Cardio Machine,Gym Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1978-side-steps-on-stairs-how-to-do-exercise"
        },
        133=> {
            "name"=> "Side to Side Left Leg Swings",
            "primary"=> "Glute Max,Adductors,Neck Flexors",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight,Stretching,Balance",
            "url"=> "https://www.skimble.com/exercises/1663-side-to-side-left-leg-swings-how-to-do-exercise"
        },
        134=> {
            "name"=> "Side Squats on Treadmill",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1971-side-squats-on-treadmill-how-to-do-exercise"
        },
        135=> {
            "name"=> "Side to Side Right Leg Swings",
            "primary"=> "Glute Max,Adductors,Neck Flexors",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight,Stretching,Balance",
            "url"=> "https://www.skimble.com/exercises/1662-side-to-side-right-leg-swings-how-to-do-exercise"
        },
        136=> {
            "name"=> "Sissy Squats",
            "primary"=> "Adductors,Quads,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Crossfit,",
            "url"=> "https://www.skimble.com/exercises/1110-sissy-squats-how-to-do-exercise"
        },
        137=> {
            "name"=> "Traveling Froggy Jumps",
            "primary"=> "Glute Max,Hip Flexors,Adductors,Quads,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1656-traveling-froggy-jumps-how-to-do-exercise"
        },
        138=> {
            "name"=> "Squat Pulses",
            "primary"=> "Adductors,Quads,Calves",
            "secondary"=> "Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1008-squat-pulses-how-to-do-exercise"
        },
        139=> {
            "name"=> "Supine Butterfly",
            "primary"=> "Adductors,Neck Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/949-supine-butterfly-how-to-do-exercise"
        },
        140=> {
            "name"=> "Sumo Squats",
            "primary"=> "Adductors,Quads,Hamstrings",
            "secondary"=> "Glute Max,Hip Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/7356-sumo-squats-how-to-do-exercise"
        },
        141=> {
            "name"=> "Traveling Ice Skaters",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Running,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1428-traveling-ice-skaters-how-to-do-exercise"
        },
        142=> {
            "name"=> "Twisted Root",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Adductors",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1899-twisted-root-how-to-do-exercise"
        },
        143=> {
            "name"=> "Tree Pose",
            "primary"=> "Hip Flexors,Adductors,Abductors",
            "secondary"=> "Required Equipment: Exercise Mat,No Equipment",
            "tags"=> "Yoga,Balance,",
            "url"=> "https://www.skimble.com/exercises/1399-tree-pose-how-to-do-exercise"
        },
        144=> {
            "name"=> "Walking Abductors with Band",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2418-walking-abductors-with-band-how-to-do-exercise"
        },
        145=> {
            "name"=> "Twisting Frog",
            "primary"=> "Upper Abs,Lower Abs,Adductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1901-twisting-frog-how-to-do-exercise"
        },
        146=> {
            "name"=> "Walking Abductors And Upright Row with Band",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Adductors,Abductors",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2139-walking-abductors-and-upright-row-with-band-how-to-do-exercise"
        },
        147=> {
            "name"=> "Wall Lying Leg Stretches",
            "primary"=> "Hip Flexors,Adductors",
            "secondary"=> "Required Equipment: Wall",
            "tags"=> "Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1087-wall-lying-leg-stretches-how-to-do-exercise"
        },
        148=> {
            "name"=> "Weighted Sumo Squats",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/392-weighted-sumo-squats-how-to-do-exercise"
        },
        149=> {
            "name"=> "Weighted Wide Squats",
            "primary"=> "Glute Max,Adductors,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/885-weighted-wide-squats-how-to-do-exercise"
        },
        150=> {
            "name"=> "Wide Leg Stance",
            "primary"=> "Adductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Yoga,Pilates,Bodyweight,Stretching,Balance,",
            "url"=> "https://www.skimble.com/exercises/859-wide-leg-stance-how-to-do-exercise"
        },
        151=> {
            "name"=> "Wide Leg Forward Bend",
            "primary"=> "Glute Max,Adductors,Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/2091-wide-leg-forward-bend-how-to-do-exercise"
        },
        152=> {
            "name"=> "Wide Left Leg Stretch",
            "primary"=> "Adductors,Hamstrings",
            "secondary"=> "Lats,Lower Back",
            "tags"=> "Exercise Mat,Warmup,Cooldown,Yoga,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/938-wide-left-leg-stretch-how-to-do-exercise"
        },
        153=> {
            "name"=> "Wide Right Leg Stretch",
            "primary"=> "Adductors,Hamstrings",
            "secondary"=> "Lats,Lower Back",
            "tags"=> "Exercise Mat,Warmup,Cooldown,Yoga,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/937-wide-right-leg-stretch-how-to-do-exercise"
        },
        154=> {
            "name"=> "Wide Leg Stretches",
            "primary"=> "Adductors,Hamstrings",
            "secondary"=> "Lats,Lower Back",
            "tags"=> "Exercise Mat,Warmup,Cooldown,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/954-wide-leg-stretches-how-to-do-exercise"
        },
        155=> {
            "name"=> "90 Degree Hang",
            "primary"=> "Rear Shoulders,Biceps,Lats,Rhomboids",
            "secondary"=> "Supinator,Transverse Abdominis,Traps",
            "tags"=> "Pull Up Bar,Bodyweight,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/65-90-degree-hang-how-to-do-exercise"
        },
        156=> {
            "name"=> "Advanced Crane Sequence",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Upper Abs,Lower Abs",
            "secondary"=> "Lats,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1727-advanced-crane-sequence-how-to-do-exercise"
        },
        157=> {
            "name"=> "Advanced Assisted Handstand",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps",
            "secondary"=> "Wrist Flexors,Upper Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2089-advanced-assisted-handstand-how-to-do-exercise"
        },
        158=> {
            "name"=> "Advanced Sun Salutation",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Wrist Flexors,Upper Chest,Upper Abs,Lower Abs,Transverse Abdominis,Traps,Lats,Glute Max,Hamstrings,Calves,Neck Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1712-advanced-sun-salutation-how-to-do-exercise"
        },
        159=> {
            "name"=> "Alternating Bent Over Rows",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Traps,Lats,Lower Back,Rhomboids,Back Extensors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2327-alternating-bent-over-rows-how-to-do-exercise"
        },
        160=> {
            "name"=> "Advanced Crow Sequence",
            "primary"=> "Triceps,Biceps,Supinator,Upper Chest,Middle Chest,Upper Abs",
            "secondary"=> "Traps,Lats",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1813-advanced-crow-sequence-how-to-do-exercise"
        },
        161=> {
            "name"=> "Alternating Dumbbell Curl to Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps",
            "secondary"=> "Upper Chest",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2405-alternating-dumbbell-curl-to-press-how-to-do-exercise"
        },
        162=> {
            "name"=> "Alternating Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Supinator",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/492-alternating-bicep-curls-how-to-do-exercise"
        },
        163=> {
            "name"=> "Alternating Hammer Curls",
            "primary"=> "Biceps",
            "secondary"=> "Elbow Flexors",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2438-alternating-hammer-curls-how-to-do-exercise"
        },
        164=> {
            "name"=> "Army Crawls",
            "primary"=> "Biceps,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1670-army-crawls-how-to-do-exercise"
        },
        165=> {
            "name"=> "Alternating Incline Dumbbell Curls",
            "primary"=> "Biceps",
            "secondary"=> "Front Shoulders,Wrist Flexors",
            "tags"=> "Dumbbells,Bench,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2273-alternating-incline-dumbbell-curls-how-to-do-exercise"
        },
        166=> {
            "name"=> "Assault Bike",
            "primary"=> "Triceps,Biceps,Lats,Glute Max,Quads,Hamstrings",
            "secondary"=> "Upper Chest,Middle Chest,Lower Chest,Left Obliques,Right Obliques,Lower Back,Pec Minor,Back Extensors",
            "tags"=> "Strength Machine,Exercise Machine,Home Equipment,Crossfit,Biking",
            "url"=> "https://www.skimble.com/exercises/44410-assault-bike-how-to-do-exercise"
        },
        167=> {
            "name"=> "Band Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Home Equipment,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1717-band-bicep-curls-how-to-do-exercise"
        },
        168=> {
            "name"=> "Assisted Handstand",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps",
            "secondary"=> "Wrist Flexors,Upper Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2025-assisted-handstand-how-to-do-exercise"
        },
        169=> {
            "name"=> "Barbell Bicep Curl to Press",
            "primary"=> "Biceps,Elbow Flexors",
            "secondary"=> "Front Shoulders,Wrist Flexors,Traps,Levator Scapula",
            "tags"=> "Barbells,Strength",
            "url"=> "https://www.skimble.com/exercises/1960-barbell-bicep-curl-to-press-how-to-do-exercise"
        },
        170=> {
            "name"=> "Barbell Reverse Curl to Press",
            "primary"=> "Biceps,Elbow Flexors",
            "secondary"=> "Front Shoulders,Traps,Wrist Extensors,Levator Scapula",
            "tags"=> "Barbells,Strength",
            "url"=> "https://www.skimble.com/exercises/1959-barbell-reverse-curl-to-press-how-to-do-exercise"
        },
        171=> {
            "name"=> "Barbell Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Required Equipment: Barbells",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1168-barbell-bicep-curls-how-to-do-exercise"
        },
        172=> {
            "name"=> "Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Supinator,Wrist Flexors,Elbow Flexors",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2437-bicep-curls-how-to-do-exercise"
        },
        173=> {
            "name"=> "BOSU Left Offset Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Transverse Abdominis",
            "secondary"=> "Wrist Flexors",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1260-bosu-left-offset-push-ups-how-to-do-exercise"
        },
        174=> {
            "name"=> "Bicep Stretches",
            "primary"=> "Biceps",
            "secondary"=> "Rear Shoulders,Triceps,Wrist Flexors",
            "tags"=> "Exercise Mat,Stretching",
            "url"=> "https://www.skimble.com/exercises/1890-bicep-stretches-how-to-do-exercise"
        },
        175=> {
            "name"=> "BOSU Right Offset Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Transverse Abdominis",
            "secondary"=> "Wrist Flexors",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1259-bosu-right-offset-push-ups-how-to-do-exercise"
        },
        176=> {
            "name"=> "Burpee Pull-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Middle Chest,Lats,Glute Max,Quads,Hamstrings",
            "secondary"=> "Upper Abs,Transverse Abdominis",
            "tags"=> "Pull Up Bar,Bodyweight,Home Equipment,Crossfit,Rock Climbing",
            "url"=> "https://www.skimble.com/exercises/846-burpee-pull-ups-how-to-do-exercise"
        },
        177=> {
            "name"=> "Cable Lat Pull Down",
            "primary"=> "Biceps,Lats,Teres Major",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2331-cable-lat-pull-down-how-to-do-exercise"
        },
        178=> {
            "name"=> "Chaturanga",
            "primary"=> "Triceps,Biceps,Transverse Abdominis",
            "secondary"=> "Rear Shoulders,Biceps,Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/20-chaturanga-how-to-do-exercise"
        },
        179=> {
            "name"=> "Circular Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Transverse Abdominis",
            "secondary"=> "Wrist Flexors,Middle Chest",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1258-circular-push-ups-how-to-do-exercise"
        },
        180=> {
            "name"=> "Chin-Ups",
            "primary"=> "Front Shoulders,Biceps,Lats,Rhomboids",
            "secondary"=> "Side Shoulders,Rear Shoulders,Supinator,Upper Abs,Lower Abs",
            "tags"=> "Pull Up Bar,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/276-chin-ups-how-to-do-exercise"
        },
        181=> {
            "name"=> "Down Unders",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps,Middle Chest",
            "secondary"=> "Rear Shoulders,Transverse Abdominis,Lats,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1007-down-unders-how-to-do-exercise"
        },
        182=> {
            "name"=> "Clapping Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps,Transverse Abdominis",
            "secondary"=> "Wrist Flexors,Upper Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1102-clapping-push-ups-how-to-do-exercise"
        },
        183=> {
            "name"=> "Closed Grip Lat Pull-downs",
            "primary"=> "Biceps,Lats,Teres Major,Elbow Flexors",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2335-closed-grip-lat-pull-downs-how-to-do-exercise"
        },
        184=> {
            "name"=> "Cross Body Hammer Curls",
            "primary"=> "Biceps",
            "secondary"=> "Triceps,Supinator,Elbow Flexors,Pronators",
            "tags"=> "Dumbbells,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2281-cross-body-hammer-curls-how-to-do-exercise"
        },
        185=> {
            "name"=> "Dumbbell Hammer Curl to Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Elbow Flexors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2049-dumbbell-hammer-curl-to-press-how-to-do-exercise"
        },
        186=> {
            "name"=> "Dumbbell Single Leg Curl to Press",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Quads",
            "secondary"=> "Lats,Glute Max,Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Crossfit,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/925-dumbbell-single-leg-curl-to-press-how-to-do-exercise"
        },
        187=> {
            "name"=> "Dumbbell Upright Row to Shoulder Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Traps",
            "secondary"=> "Triceps",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2404-dumbbell-upright-row-to-shoulder-press-how-to-do-exercise"
        },
        188=> {
            "name"=> "Elbows to Hands Plank",
            "primary"=> "Triceps,Biceps,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Supinator,Upper Abs,Lower Abs,Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1010-elbows-to-hands-plank-how-to-do-exercise"
        },
        189=> {
            "name"=> "Feet on Wall Push-Ups",
            "primary"=> "Triceps,Biceps,Wrist Flexors,Upper Chest",
            "secondary"=> "Elbow Flexors",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1451-feet-on-wall-push-ups-how-to-do-exercise"
        },
        190=> {
            "name"=> "Forearm Dolphin Push-ups",
            "primary"=> "Triceps,Biceps,Supinator,Transverse Abdominis",
            "secondary"=> "Side Shoulders",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1129-forearm-dolphin-push-ups-how-to-do-exercise"
        },
        191=> {
            "name"=> "Hammer Curls",
            "primary"=> "Biceps",
            "secondary"=> "Elbow Flexors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/258-hammer-curls-how-to-do-exercise"
        },
        192=> {
            "name"=> "Hand Release Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps,Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2247-hand-release-push-ups-how-to-do-exercise"
        },
        193=> {
            "name"=> "Isometric Bicep Curls",
            "primary"=> "Biceps,Wrist Flexors",
            "secondary"=> "Triceps,Supinator",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1133-isometric-bicep-curls-how-to-do-exercise"
        },
        194=> {
            "name"=> "Headstand",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Traps,Lats",
            "secondary"=> "Lower Abs,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1393-headstand-how-to-do-exercise"
        },
        195=> {
            "name"=> "Handstand",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps",
            "secondary"=> "Upper Abs",
            "tags"=> "Exercise Mat,Yoga,Crossfit",
            "url"=> "https://www.skimble.com/exercises/1452-handstand-how-to-do-exercise"
        },
        196=> {
            "name"=> "Kettlebell Hammer Curls",
            "primary"=> "Biceps,Elbow Flexors",
            "secondary"=> "Required Equipment: Kettlebells",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1557-kettlebell-hammer-curls-how-to-do-exercise"
        },
        197=> {
            "name"=> "Kettlebell Around the Waist",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: Kettlebells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2150-kettlebell-around-the-waist-how-to-do-exercise"
        },
        198=> {
            "name"=> "Kettlebell Curl to Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps",
            "secondary"=> "Required Equipment: Kettlebells",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2040-kettlebell-curl-to-press-how-to-do-exercise"
        },
        199=> {
            "name"=> "Kettlebell Upright Rows",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Traps",
            "secondary"=> "Required Equipment: Kettlebells",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2039-kettlebell-upright-rows-how-to-do-exercise"
        },
        200=> {
            "name"=> "Kettlebell Right Arm Bottoms Up Press",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Upper Chest",
            "secondary"=> "Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back,Back Extensors",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2046-kettlebell-right-arm-bottoms-up-press-how-to-do-exercise"
        },
        201=> {
            "name"=> "Kettlebell Left Arm Bottoms Up Press",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Upper Chest",
            "secondary"=> "Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back,Back Extensors",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2047-kettlebell-left-arm-bottoms-up-press-how-to-do-exercise"
        },
        202=> {
            "name"=> "L Pull-Ups",
            "primary"=> "Front Shoulders,Biceps,Lats,Hip Flexors",
            "secondary"=> "Lower Abs",
            "tags"=> "Pull Up Bar,Bodyweight,Home Equipment,Crossfit,Rock Climbing",
            "url"=> "https://www.skimble.com/exercises/1950-l-pull-ups-how-to-do-exercise"
        },
        203=> {
            "name"=> "L Rope Climb",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Supinator,Middle Chest,Upper Abs,Lower Abs,Lats,Hip Flexors",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Crossfit,Stretching,Gym Equipment,",
            "url"=> "https://www.skimble.com/exercises/5381-l-rope-climb-how-to-do-exercise"
        },
        204=> {
            "name"=> "Left Concentrated Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Triceps,Supinator",
            "tags"=> "Dumbbells,Bench,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1125-left-concentrated-bicep-curls-how-to-do-exercise"
        },
        205=> {
            "name"=> "Left Downward Dog Scorpion",
            "primary"=> "Triceps,Biceps,Glute Max,Hip Flexors,Quads",
            "secondary"=> "Lats",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2064-left-downward-dog-scorpion-how-to-do-exercise"
        },
        206=> {
            "name"=> "Left Archer in Warrior 2",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Glute Max,Quads,Neck Flexors",
            "secondary"=> "Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1819-left-archer-in-warrior-2-how-to-do-exercise"
        },
        207=> {
            "name"=> "Left Kettlebell Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Supinator,Wrist Flexors",
            "tags"=> "Kettlebells,Strength",
            "url"=> "https://www.skimble.com/exercises/1603-left-kettlebell-bicep-curls-how-to-do-exercise"
        },
        208=> {
            "name"=> "Left Leg Romanian Dead Lift to Curl Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Glute Max,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Balance,Strength,",
            "url"=> "https://www.skimble.com/exercises/2324-left-leg-romanian-dead-lift-to-curl-press-how-to-do-exercise"
        },
        209=> {
            "name"=> "Left Twisting Scissors",
            "primary"=> "Triceps,Biceps,Upper Abs,Glute Max",
            "secondary"=> "Lower Abs,Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2066-left-twisting-scissors-how-to-do-exercise"
        },
        210=> {
            "name"=> "Left Lunge with Band Bicep Curl",
            "primary"=> "Biceps,Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/1991-left-lunge-with-band-bicep-curl-how-to-do-exercise"
        },
        211=> {
            "name"=> "Left Upper Cuts",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps",
            "secondary"=> "Middle Chest",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1192-left-upper-cuts-how-to-do-exercise"
        },
        212=> {
            "name"=> "Modified Chaturanga",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps",
            "secondary"=> "Supinator,Wrist Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/298-modified-chaturanga-how-to-do-exercise"
        },
        213=> {
            "name"=> "Lunge to Shoulder Press",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps,Quads",
            "secondary"=> "Rear Shoulders",
            "tags"=> "Dumbbells,Home Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/1122-lunge-to-shoulder-press-how-to-do-exercise"
        },
        214=> {
            "name"=> "Modified Burpees",
            "primary"=> "Triceps,Biceps,Quads",
            "secondary"=> "Side Shoulders,Front Shoulders,Transverse Abdominis,Lats,Glute Max,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2207-modified-burpees-how-to-do-exercise"
        },
        215=> {
            "name"=> "Muscle Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Lats",
            "secondary"=> "Transverse Abdominis,Rhomboids",
            "tags"=> "Pull Up Bar,Home Equipment,Crossfit,Rock Climbing,Strength",
            "url"=> "https://www.skimble.com/exercises/819-muscle-ups-how-to-do-exercise"
        },
        216=> {
            "name"=> "Modified Vinyasa",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Lats,Lower Back,Rhomboids",
            "secondary"=> "Lower Abs,Transverse Abdominis,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1854-modified-vinyasa-how-to-do-exercise"
        },
        217=> {
            "name"=> "One Arm Dumbbell Rows",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Lats,Lower Back,Rhomboids,Back Extensors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2338-one-arm-dumbbell-rows-how-to-do-exercise"
        },
        218=> {
            "name"=> "Push-Up and Rotation",
            "primary"=> "Side Shoulders,Biceps,Upper Chest,Middle Chest,Lower Chest,Transverse Abdominis",
            "secondary"=> "Triceps",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2235-push-up-and-rotation-how-to-do-exercise"
        },
        219=> {
            "name"=> "Partner Push-Ups with Shoulder Taps",
            "primary"=> "Triceps,Biceps,Upper Chest,Middle Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/2118-partner-push-ups-with-shoulder-taps-how-to-do-exercise"
        },
        220=> {
            "name"=> "Push-Up to Row to Burpee",
            "primary"=> "Triceps,Biceps,Upper Chest,Middle Chest,Lower Chest,Traps,Lats,Quads,Hamstrings,Calves,Lower Back,Rhomboids,Back Extensors",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Dumbbells,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/2323-push-up-to-row-to-burpee-how-to-do-exercise"
        },
        221=> {
            "name"=> "Right Archer in Warrior 2",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Glute Max,Quads,Neck Flexors",
            "secondary"=> "Adductors,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1798-right-archer-in-warrior-2-how-to-do-exercise"
        },
        222=> {
            "name"=> "Right Concentrated Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Triceps,Supinator",
            "tags"=> "Dumbbells,Bench,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1124-right-concentrated-bicep-curls-how-to-do-exercise"
        },
        223=> {
            "name"=> "Push-Ups on Stability Ball",
            "primary"=> "Triceps,Biceps,Upper Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1308-push-ups-on-stability-ball-how-to-do-exercise"
        },
        224=> {
            "name"=> "Right Downward Dog Scorpion",
            "primary"=> "Triceps,Biceps,Glute Max,Hip Flexors,Quads",
            "secondary"=> "Lats",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1944-right-downward-dog-scorpion-how-to-do-exercise"
        },
        225=> {
            "name"=> "Right Kettlebell Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Supinator,Wrist Flexors",
            "tags"=> "Kettlebells,Strength",
            "url"=> "https://www.skimble.com/exercises/1602-right-kettlebell-bicep-curls-how-to-do-exercise"
        },
        226=> {
            "name"=> "Right Leg Romanian Dead Lift to Curl Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Glute Max,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Crossfit,Balance,Strength,",
            "url"=> "https://www.skimble.com/exercises/2325-right-leg-romanian-dead-lift-to-curl-press-how-to-do-exercise"
        },
        227=> {
            "name"=> "Right Lunge with Band Bicep Curl",
            "primary"=> "Biceps,Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Resistance Bands,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1990-right-lunge-with-band-bicep-curl-how-to-do-exercise"
        },
        228=> {
            "name"=> "Right Scissors",
            "primary"=> "Biceps,Transverse Abdominis,Quads",
            "secondary"=> "Lower Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1946-right-scissors-how-to-do-exercise"
        },
        229=> {
            "name"=> "Right Upper Cuts",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps",
            "secondary"=> "Middle Chest",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1191-right-upper-cuts-how-to-do-exercise"
        },
        230=> {
            "name"=> "Ring Spiderman",
            "primary"=> "Triceps,Biceps,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Glute Max,Hamstrings",
            "tags"=> "Rings,Crossfit,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5373-ring-spiderman-how-to-do-exercise"
        },
        231=> {
            "name"=> "Rope Climb",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Supinator,Middle Chest,Upper Abs,Lower Abs,Lats",
            "secondary"=> "Quads",
            "tags"=> "Crossfit,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/850-rope-climb-how-to-do-exercise"
        },
        232=> {
            "name"=> "Sandbag Bear Hug Walk",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Wrist Flexors,Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Sandbags",
            "tags"=> "Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/543-sandbag-bear-hug-walk-how-to-do-exercise"
        },
        233=> {
            "name"=> "Seated Archer",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1941-seated-archer-how-to-do-exercise"
        },
        234=> {
            "name"=> "Seated Ball Toss with Standing Partner",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs",
            "secondary"=> "Triceps,Hip Flexors",
            "tags"=> "Medicine Ball,Home Equipment,Strength,Partner",
            "url"=> "https://www.skimble.com/exercises/1580-seated-ball-toss-with-standing-partner-how-to-do-exercise"
        },
        235=> {
            "name"=> "Seated Bicep Curls",
            "primary"=> "Biceps",
            "secondary"=> "Front Shoulders,Supinator,Wrist Flexors,Upper Chest",
            "tags"=> "Dumbbells,Chair,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1047-seated-bicep-curls-how-to-do-exercise"
        },
        236=> {
            "name"=> "Side Squat Ball Toss",
            "primary"=> "Biceps,Left Obliques,Right Obliques,Quads",
            "secondary"=> "Side Shoulders,Front Shoulders,Triceps",
            "tags"=> "Medicine Ball,Home Equipment,Gym Equipment,Strength,Partner",
            "url"=> "https://www.skimble.com/exercises/1578-side-squat-ball-toss-how-to-do-exercise"
        },
        237=> {
            "name"=> "Single-Arm Chin-Ups",
            "primary"=> "Front Shoulders,Biceps,Supinator,Wrist Flexors,Lats",
            "secondary"=> "Side Shoulders,Upper Abs",
            "tags"=> "Pull Up Bar,Strength",
            "url"=> "https://www.skimble.com/exercises/441-single-arm-chin-ups-how-to-do-exercise"
        },
        238=> {
            "name"=> "Squat and Row with Band",
            "primary"=> "Biceps,Glute Max,Quads,Rhomboids",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2132-squat-and-row-with-band-how-to-do-exercise"
        },
        239=> {
            "name"=> "Stability Ball Dribble",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps,Wrist Flexors,Elbow Flexors",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1309-stability-ball-dribble-how-to-do-exercise"
        },
        240=> {
            "name"=> "Staggered Arm Spiderman Push-Ups",
            "primary"=> "Triceps,Biceps,Transverse Abdominis,Neck Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Left Obliques,Right Obliques,Glute Max,Hamstrings",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1098-staggered-arm-spiderman-push-ups-how-to-do-exercise"
        },
        241=> {
            "name"=> "Step or Hop to Plank",
            "primary"=> "Triceps,Biceps,Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/982-step-or-hop-to-plank-how-to-do-exercise"
        },
        242=> {
            "name"=> "Torso Rotations with Medicine Ball",
            "primary"=> "Front Shoulders,Biceps,Left Obliques,Right Obliques",
            "secondary"=> "Hip Flexors,Lower Back,Back Extensors",
            "tags"=> "Stability Ball,Medicine Ball,Strength",
            "url"=> "https://www.skimble.com/exercises/1560-torso-rotations-with-medicine-ball-how-to-do-exercise"
        },
        243=> {
            "name"=> "Tripod Headstand",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Upper Abs,Traps",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1634-tripod-headstand-how-to-do-exercise"
        },
        244=> {
            "name"=> "Tripod Headstand Prep",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Lower Abs,Traps",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1635-tripod-headstand-prep-how-to-do-exercise"
        },
        245=> {
            "name"=> "Up Down High Fives",
            "primary"=> "Triceps,Biceps,Upper Chest,Middle Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/2119-up-down-high-fives-how-to-do-exercise"
        },
        246=> {
            "name"=> "Upward Facing Dog",
            "primary"=> "Triceps,Biceps,Traps,Lats",
            "secondary"=> "Transverse Abdominis,Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/607-upward-facing-dog-how-to-do-exercise"
        },
        247=> {
            "name"=> "Vinyasa",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps,Wrist Flexors,Middle Chest,Lower Abs,Transverse Abdominis,Traps,Lats,Glute Max,Quads,Hamstrings,Calves,Rhomboids",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1848-vinyasa-how-to-do-exercise"
        },
        248=> {
            "name"=> "Wall Diamond Push-Ups",
            "primary"=> "Triceps,Biceps,Upper Chest",
            "secondary"=> "Required Equipment: Wall",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1091-wall-diamond-push-ups-how-to-do-exercise"
        },
        249=> {
            "name"=> "Wall Push-Ups",
            "primary"=> "Front Shoulders,Biceps,Upper Chest,Middle Chest,Lower Chest,Transverse Abdominis,Rhomboids",
            "secondary"=> "Rear Shoulders,Lower Back",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/271-wall-push-ups-how-to-do-exercise"
        },
        250=> {
            "name"=> "Wall Push-Ups with Clap",
            "primary"=> "Biceps,Upper Chest",
            "secondary"=> "Triceps",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1085-wall-push-ups-with-clap-how-to-do-exercise"
        },
        251=> {
            "name"=> "Wall Push-Ups with Leg Lifts",
            "primary"=> "Biceps",
            "secondary"=> "Glute Max,Quads,Hamstrings",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1084-wall-push-ups-with-leg-lifts-how-to-do-exercise"
        },
        252=> {
            "name"=> "Wind-Removing Pose",
            "primary"=> "Front Shoulders,Biceps,Hip Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2259-wind-removing-pose-how-to-do-exercise"
        },
        253=> {
            "name"=> "Yoga Side Planks",
            "primary"=> "Side Shoulders,Front Shoulders,Biceps,Supinator,Wrist Flexors",
            "secondary"=> "Lower Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1278-yoga-side-planks-how-to-do-exercise"
        },
        254=> {
            "name"=> "4-Square Single Leg Hops",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Home Equipment,Balance,",
            "url"=> "https://www.skimble.com/exercises/1003-4-square-single-leg-hops-how-to-do-exercise"
        },
        255=> {
            "name"=> "Backwards Jump Rope",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves,Plantar Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Rhomboids,Serratus Anterior",
            "tags"=> "Jump Rope,Home Equipment,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/1967-backwards-jump-rope-how-to-do-exercise"
        },
        256=> {
            "name"=> "Basic Sun Salutation",
            "primary"=> "Side Shoulders,Lats,Glute Max,Quads,Hamstrings,Calves,Lower Back",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1636-basic-sun-salutation-how-to-do-exercise"
        },
        257=> {
            "name"=> "Basketball Shots",
            "primary"=> "Triceps,Supinator,Wrist Flexors,Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Home Equipment,Cardio,",
            "url"=> "https://www.skimble.com/exercises/225-basketball-shots-how-to-do-exercise"
        },
        258=> {
            "name"=> "Bench Barbell Calf Raises",
            "primary"=> "Calves,Plantar Flexors",
            "secondary"=> "Required Equipment: Barbells,Box or Step",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2387-bench-barbell-calf-raises-how-to-do-exercise"
        },
        259=> {
            "name"=> "Big Toe Forward Bend",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Lats,Glute Max,Quads",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1283-big-toe-forward-bend-how-to-do-exercise"
        },
        260=> {
            "name"=> "Bike Slowly",
            "primary"=> "Quads,Calves",
            "secondary"=> "Hip Flexors,Hamstrings",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/890-bike-slowly-how-to-do-exercise"
        },
        261=> {
            "name"=> "BOSU Split Squats",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back,Dorsiflexors",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/2034-bosu-split-squats-how-to-do-exercise"
        },
        262=> {
            "name"=> "Box Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Box or Step",
            "tags"=> "Bodyweight,Crossfit,",
            "url"=> "https://www.skimble.com/exercises/387-box-jumps-how-to-do-exercise"
        },
        263=> {
            "name"=> "Boxer Shuffle",
            "primary"=> "Calves",
            "secondary"=> "Front Shoulders,Biceps,Quads,Rhomboids",
            "tags"=> "Jump Rope,Warmup,Home Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/491-boxer-shuffle-how-to-do-exercise"
        },
        264=> {
            "name"=> "Calf Rolls",
            "primary"=> "Calves",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1436-calf-rolls-how-to-do-exercise"
        },
        265=> {
            "name"=> "Calf Smasher",
            "primary"=> "Calves",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3004-calf-smasher-how-to-do-exercise"
        },
        266=> {
            "name"=> "Chair Butt Kickers",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Chair",
            "tags"=> "Warmup,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1103-chair-butt-kickers-how-to-do-exercise"
        },
        267=> {
            "name"=> "Clockwise Four Square Hops",
            "primary"=> "Quads,Calves",
            "secondary"=> "Transverse Abdominis,Glute Max,Hamstrings",
            "tags"=> "No Equipment,Warmup,Bodyweight,Home Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1028-clockwise-four-square-hops-how-to-do-exercise"
        },
        268=> {
            "name"=> "Cool Down Jogging",
            "primary"=> "Quads,Calves",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "No Equipment,Cooldown,Cardio",
            "url"=> "https://www.skimble.com/exercises/316-cool-down-jogging-how-to-do-exercise"
        },
        269=> {
            "name"=> "Counterclockwise Four Square Hops",
            "primary"=> "Quads,Calves",
            "secondary"=> "Transverse Abdominis,Glute Max,Hamstrings",
            "tags"=> "No Equipment,Warmup,Bodyweight,Home Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1029-counterclockwise-four-square-hops-how-to-do-exercise"
        },
        270=> {
            "name"=> "Crescent to Left Low Lunge",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2408-crescent-to-left-low-lunge-how-to-do-exercise"
        },
        271=> {
            "name"=> "Crescent to Right Low Lunge",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2407-crescent-to-right-low-lunge-how-to-do-exercise"
        },
        272=> {
            "name"=> "Crossed-Arms Front Barbell Squats",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Barbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2330-crossed-arms-front-barbell-squats-how-to-do-exercise"
        },
        273=> {
            "name"=> "Double Stair Stepping",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2427-double-stair-stepping-how-to-do-exercise"
        },
        274=> {
            "name"=> "Double Unders",
            "primary"=> "Calves",
            "secondary"=> "Side Shoulders,Triceps,Biceps,Rhomboids",
            "tags"=> "Jump Rope,Warmup,Home Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/793-double-unders-how-to-do-exercise"
        },
        275=> {
            "name"=> "Downward Facing Dog with Calf Stretch",
            "primary"=> "Lats,Calves",
            "secondary"=> "Hamstrings",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3003-downward-facing-dog-with-calf-stretch-how-to-do-exercise"
        },
        276=> {
            "name"=> "Dumbbell Left Split Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Balance,Strength,",
            "url"=> "https://www.skimble.com/exercises/1159-dumbbell-left-split-jumps-how-to-do-exercise"
        },
        277=> {
            "name"=> "Downward Facing Dog with Right Leg Raise",
            "primary"=> "Side Shoulders,Rear Shoulders,Wrist Flexors,Glute Max,Hamstrings,Calves",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1397-downward-facing-dog-with-right-leg-raise-how-to-do-exercise"
        },
        278=> {
            "name"=> "Downward-Facing Dog with Left Leg Raise",
            "primary"=> "Side Shoulders,Rear Shoulders,Wrist Flexors,Hamstrings,Calves",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1852-downward-facing-dog-with-left-leg-raise-how-to-do-exercise"
        },
        279=> {
            "name"=> "Dumbbell Romanian Deadlifts",
            "primary"=> "Glute Max,Hamstrings,Calves,Lower Back",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/2396-dumbbell-romanian-deadlifts-how-to-do-exercise"
        },
        280=> {
            "name"=> "Dumbbell Right Leg Squats",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Lower Back",
            "tags"=> "Dumbbells,Home Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/1152-dumbbell-right-leg-squats-how-to-do-exercise"
        },
        281=> {
            "name"=> "Dumbbell Right Split Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Balance,Strength,",
            "url"=> "https://www.skimble.com/exercises/1158-dumbbell-right-split-jumps-how-to-do-exercise"
        },
        282=> {
            "name"=> "Fold Forward",
            "primary"=> "Glute Max,Hamstrings,Calves",
            "secondary"=> "Rear Shoulders,Traps",
            "tags"=> "Exercise Mat,No Equipment,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/147-fold-forward-how-to-do-exercise"
        },
        283=> {
            "name"=> "Forward Backward Hops",
            "primary"=> "Quads,Calves",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1025-forward-backward-hops-how-to-do-exercise"
        },
        284=> {
            "name"=> "Four Square Shuffle & Bear Crawls",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1671-four-square-shuffle-bear-crawls-how-to-do-exercise"
        },
        285=> {
            "name"=> "Dumbbell Squat Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/927-dumbbell-squat-jumps-how-to-do-exercise"
        },
        286=> {
            "name"=> "Froggy Jumps",
            "primary"=> "Glute Max,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/807-froggy-jumps-how-to-do-exercise"
        },
        287=> {
            "name"=> "High Knees",
            "primary"=> "Glute Max,Hip Flexors,Quads,Calves",
            "secondary"=> "Transverse Abdominis,Adductors",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/310-high-knees-how-to-do-exercise"
        },
        288=> {
            "name"=> "Heel Walks",
            "primary"=> "Calves",
            "secondary"=> "Glute Max,Quads",
            "tags"=> "No Equipment,Warmup,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1140-heel-walks-how-to-do-exercise"
        },
        289=> {
            "name"=> "Get Ups with Dumbbells",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2402-get-ups-with-dumbbells-how-to-do-exercise"
        },
        290=> {
            "name"=> "Heel Toe Rocks",
            "primary"=> "Calves,Dorsiflexors,Plantar Flexors",
            "secondary"=> "Glute Max,Quads,Hamstrings",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2213-heel-toe-rocks-how-to-do-exercise"
        },
        291=> {
            "name"=> "High Knee Drill",
            "primary"=> "Glute Max,Hip Flexors,Quads,Hamstrings,Calves",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Warmup,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/1740-high-knee-drill-how-to-do-exercise"
        },
        292=> {
            "name"=> "Half Bound Lotus",
            "primary"=> "Lats,Hamstrings,Calves",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1253-half-bound-lotus-how-to-do-exercise"
        },
        293=> {
            "name"=> "Front to Back Single Leg Hops",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Balance,",
            "url"=> "https://www.skimble.com/exercises/1002-front-to-back-single-leg-hops-how-to-do-exercise"
        },
        294=> {
            "name"=> "Front Back Hops in Place",
            "primary"=> "Quads,Calves",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1027-front-back-hops-in-place-how-to-do-exercise"
        },
        295=> {
            "name"=> "High Heel Parallels",
            "primary"=> "Quads,Calves",
            "secondary"=> "Glute Max,Hip Flexors",
            "tags"=> "Chair,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1993-high-heel-parallels-how-to-do-exercise"
        },
        296=> {
            "name"=> "Hop in Place",
            "primary"=> "Calves",
            "secondary"=> "Quads",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/487-hop-in-place-how-to-do-exercise"
        },
        297=> {
            "name"=> "Jump or Step Legs to Hands",
            "primary"=> "Lower Abs,Glute Max,Quads,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/724-jump-or-step-legs-to-hands-how-to-do-exercise"
        },
        298=> {
            "name"=> "Left Half Split",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Rear Shoulders",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1895-left-half-split-how-to-do-exercise"
        },
        299=> {
            "name"=> "Ice Skaters",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Glute Max,Hip Flexors,Rhomboids",
            "tags"=> "No Equipment,Warmup,Cardio",
            "url"=> "https://www.skimble.com/exercises/1012-ice-skaters-how-to-do-exercise"
        },
        300=> {
            "name"=> "Hopping Hand Twists",
            "primary"=> "Wrist Flexors,Glute Max,Hip Flexors,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Dance,",
            "url"=> "https://www.skimble.com/exercises/1265-hopping-hand-twists-how-to-do-exercise"
        },
        301=> {
            "name"=> "Jumping Lunges",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,Strength,",
            "url"=> "https://www.skimble.com/exercises/904-jumping-lunges-how-to-do-exercise"
        },
        302=> {
            "name"=> "Jump Rope",
            "primary"=> "Calves",
            "secondary"=> "Front Shoulders,Biceps,Quads,Rhomboids",
            "tags"=> "Jump Rope,Warmup,Home Equipment,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/474-jump-rope-how-to-do-exercise"
        },
        303=> {
            "name"=> "Left Lateral Lunge with Kettlebell",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves,Abductors",
            "secondary"=> "Triceps,Adductors,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2165-left-lateral-lunge-with-kettlebell-how-to-do-exercise"
        },
        304=> {
            "name"=> "Left Pyramid",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Lats,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1842-left-pyramid-how-to-do-exercise"
        },
        305=> {
            "name"=> "Jump Kicks",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Glute Max,Hip Flexors,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1203-jump-kicks-how-to-do-exercise"
        },
        306=> {
            "name"=> "Knee Circles",
            "primary"=> "Quads,Calves,Knee Flexors",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/882-knee-circles-how-to-do-exercise"
        },
        307=> {
            "name"=> "Jump Rope (Forward)",
            "primary"=> "Calves",
            "secondary"=> "Side Shoulders,Triceps,Biceps,Quads,Rhomboids",
            "tags"=> "Jump Rope,Warmup,Home Equipment,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/787-jump-rope-forward-how-to-do-exercise"
        },
        308=> {
            "name"=> "Left Extended Hand-To-Big-Toe Sequence",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Hamstrings,Calves",
            "secondary"=> "Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2063-left-extended-hand-to-big-toe-sequence-how-to-do-exercise"
        },
        309=> {
            "name"=> "Left Romanian Kettlebell Deadlifts",
            "primary"=> "Glute Max,Hamstrings,Calves,Lower Back",
            "secondary"=> "Required Equipment: Kettlebells",
            "tags"=> "Crossfit,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/5366-left-romanian-kettlebell-deadlifts-how-to-do-exercise"
        },
        310=> {
            "name"=> "Left Warrior 3 with Eagle Arms",
            "primary"=> "Side Shoulders,Rear Shoulders,Traps,Glute Max,Hamstrings,Calves",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1648-left-warrior-3-with-eagle-arms-how-to-do-exercise"
        },
        311=> {
            "name"=> "Left Standing Split",
            "primary"=> "Glute Max,Hip Flexors,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1387-left-standing-split-how-to-do-exercise"
        },
        312=> {
            "name"=> "Over Over Unders",
            "primary"=> "Quads,Calves",
            "secondary"=> "Transverse Abdominis,Traps,Adductors,Hamstrings,Lower Back",
            "tags"=> "No Equipment,Warmup,Bodyweight,Balance,Cardio",
            "url"=> "https://www.skimble.com/exercises/1030-over-over-unders-how-to-do-exercise"
        },
        313=> {
            "name"=> "Lunge Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/715-lunge-jumps-how-to-do-exercise"
        },
        314=> {
            "name"=> "Pogo Hops",
            "primary"=> "Calves",
            "secondary"=> "Quads",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1015-pogo-hops-how-to-do-exercise"
        },
        315=> {
            "name"=> "Reverse Lunge Elbow to Instep with Rotation",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Side Shoulders,Front Shoulders",
            "tags"=> "Exercise Mat,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2322-reverse-lunge-elbow-to-instep-with-rotation-how-to-do-exercise"
        },
        316=> {
            "name"=> "Right Extended Hand-To-Big-Toe Sequence",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Hamstrings,Calves",
            "secondary"=> "Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1925-right-extended-hand-to-big-toe-sequence-how-to-do-exercise"
        },
        317=> {
            "name"=> "Reverse Skipping Drill",
            "primary"=> "Hip Flexors,Quads,Calves",
            "secondary"=> "Front Shoulders,Rear Shoulders,Left Obliques,Right Obliques,Transverse Abdominis,Hamstrings",
            "tags"=> "No Equipment,Warmup,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1743-reverse-skipping-drill-how-to-do-exercise"
        },
        318=> {
            "name"=> "Mummy Kicks",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Glute Max,Quads,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Balance,Cardio,",
            "url"=> "https://www.skimble.com/exercises/2019-mummy-kicks-how-to-do-exercise"
        },
        319=> {
            "name"=> "Line Steps",
            "primary"=> "Quads,Calves",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1024-line-steps-how-to-do-exercise"
        },
        320=> {
            "name"=> "Left Twisting Triangle",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Hamstrings,Calves",
            "secondary"=> "Front Shoulders,Rear Shoulders,Middle Chest,Glute Max,Quads,Rhomboids",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1894-left-twisting-triangle-how-to-do-exercise"
        },
        321=> {
            "name"=> "Left Runner's Lunge",
            "primary"=> "Glute Max,Hamstrings,Calves,Neck Flexors",
            "secondary"=> "Quads",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/856-left-runners-lunge-how-to-do-exercise"
        },
        322=> {
            "name"=> "Linear Hop to Stabilization",
            "primary"=> "Quads,Calves,Neck Flexors",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Balance,Cardio",
            "url"=> "https://www.skimble.com/exercises/1031-linear-hop-to-stabilization-how-to-do-exercise"
        },
        323=> {
            "name"=> "Left Warrior 3",
            "primary"=> "Transverse Abdominis,Glute Max,Hamstrings,Calves",
            "secondary"=> "Side Shoulders,Left Obliques,Right Obliques,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/974-left-warrior-3-how-to-do-exercise"
        },
        324=> {
            "name"=> "Ragdoll Pose",
            "primary"=> "Hip Flexors,Hamstrings,Calves",
            "secondary"=> "Quads",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/3011-ragdoll-pose-how-to-do-exercise"
        },
        325=> {
            "name"=> "Outside Runners Lunges",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Glute Max,Adductors",
            "tags"=> "No Equipment,Warmup,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1366-outside-runners-lunges-how-to-do-exercise"
        },
        326=> {
            "name"=> "Right Half Split",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/956-right-half-split-how-to-do-exercise"
        },
        327=> {
            "name"=> "Right Lateral Lunge with Kettlebell",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves,Abductors",
            "secondary"=> "Triceps,Adductors,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2164-right-lateral-lunge-with-kettlebell-how-to-do-exercise"
        },
        328=> {
            "name"=> "Right Pyramid",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Lats,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1805-right-pyramid-how-to-do-exercise"
        },
        329=> {
            "name"=> "Run",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Crossfit,Running,Cardio,",
            "url"=> "https://www.skimble.com/exercises/289-run-how-to-do-exercise"
        },
        330=> {
            "name"=> "Right Warrior 3 with Eagle Arms",
            "primary"=> "Side Shoulders,Rear Shoulders,Traps,Glute Max,Hamstrings,Calves",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1870-right-warrior-3-with-eagle-arms-how-to-do-exercise"
        },
        331=> {
            "name"=> "Side to Side Hops",
            "primary"=> "Quads,Calves",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1026-side-to-side-hops-how-to-do-exercise"
        },
        332=> {
            "name"=> "Side to Side Single Leg Hops",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Home Equipment,Balance,",
            "url"=> "https://www.skimble.com/exercises/1001-side-to-side-single-leg-hops-how-to-do-exercise"
        },
        333=> {
            "name"=> "Seated Forward Bend",
            "primary"=> "Traps,Lats,Glute Max,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Exercise Mat,No Equipment",
            "tags"=> "Yoga,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/541-seated-forward-bend-how-to-do-exercise"
        },
        334=> {
            "name"=> "Shuffles to Touch",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Running,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1414-shuffles-to-touch-how-to-do-exercise"
        },
        335=> {
            "name"=> "Scissor Jump Rope",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves,Plantar Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "tags"=> "Jump Rope,Cardio",
            "url"=> "https://www.skimble.com/exercises/5380-scissor-jump-rope-how-to-do-exercise"
        },
        336=> {
            "name"=> "Right Standing Split",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1869-right-standing-split-how-to-do-exercise"
        },
        337=> {
            "name"=> "Run at a Steady Pace",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Glute Max",
            "tags"=> "No Equipment,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/420-run-at-a-steady-pace-how-to-do-exercise"
        },
        338=> {
            "name"=> "Rotating Lunges",
            "primary"=> "Side Shoulders,Quads,Hamstrings,Calves",
            "secondary"=> "Left Obliques,Right Obliques,Lats",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1365-rotating-lunges-how-to-do-exercise"
        },
        339=> {
            "name"=> "Right Romanian Kettlebell Deadlifts",
            "primary"=> "Glute Max,Hamstrings,Calves,Lower Back",
            "secondary"=> "Required Equipment: Kettlebells",
            "tags"=> "Crossfit,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/5365-right-romanian-kettlebell-deadlifts-how-to-do-exercise"
        },
        340=> {
            "name"=> "Right Modified Pyramid",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Lats,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1843-right-modified-pyramid-how-to-do-exercise"
        },
        341=> {
            "name"=> "Right Twisting Triangle",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Hamstrings,Calves",
            "secondary"=> "Front Shoulders,Rear Shoulders,Middle Chest,Traps,Quads,Rhomboids",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1800-right-twisting-triangle-how-to-do-exercise"
        },
        342=> {
            "name"=> "Runners Lunges",
            "primary"=> "Glute Max,Hamstrings,Calves,Neck Flexors",
            "secondary"=> "Quads",
            "tags"=> "No Equipment,Warmup,Cooldown,Stretching,Balance",
            "url"=> "https://www.skimble.com/exercises/1161-runners-lunges-how-to-do-exercise"
        },
        343=> {
            "name"=> "Side Jump Rope",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Quads,Hamstrings,Calves,Plantar Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Jump Rope,Cardio",
            "url"=> "https://www.skimble.com/exercises/1966-side-jump-rope-how-to-do-exercise"
        },
        344=> {
            "name"=> "Seated Cycling",
            "primary"=> "Glute Max,Hip Flexors,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Cardio Machine",
            "tags"=> "Cardio,",
            "url"=> "https://www.skimble.com/exercises/2420-seated-cycling-how-to-do-exercise"
        },
        345=> {
            "name"=> "Single Lateral Hops to Stabilization",
            "primary"=> "Quads,Calves",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Balance,Cardio",
            "url"=> "https://www.skimble.com/exercises/1032-single-lateral-hops-to-stabilization-how-to-do-exercise"
        },
        346=> {
            "name"=> "Single Leg Balance with Leg Swings",
            "primary"=> "Glute Max,Hip Flexors,Quads,Hamstrings,Calves,Abductors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Balance,",
            "url"=> "https://www.skimble.com/exercises/1005-single-leg-balance-with-leg-swings-how-to-do-exercise"
        },
        347=> {
            "name"=> "Snowboard Hops",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Balance,Cardio,",
            "url"=> "https://www.skimble.com/exercises/2014-snowboard-hops-how-to-do-exercise"
        },
        348=> {
            "name"=> "Squat Front Kicks",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Hip Flexors,Adductors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1199-squat-front-kicks-how-to-do-exercise"
        },
        349=> {
            "name"=> "Stair Stepping",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2425-stair-stepping-how-to-do-exercise"
        },
        350=> {
            "name"=> "Traveling High Knees",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Running,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1676-traveling-high-knees-how-to-do-exercise"
        },
        351=> {
            "name"=> "Standing Leg Stretches",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/971-standing-leg-stretches-how-to-do-exercise"
        },
        352=> {
            "name"=> "Stepping with Leg Extensions",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Adductors,Abductors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2428-stepping-with-leg-extensions-how-to-do-exercise"
        },
        353=> {
            "name"=> "Treadmill Running",
            "primary"=> "Quads,Hamstrings,Calves,Dorsiflexors,Plantar Flexors",
            "secondary"=> "Glute Max",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1973-treadmill-running-how-to-do-exercise"
        },
        354=> {
            "name"=> "Tip Toe Squats",
            "primary"=> "Quads,Calves",
            "secondary"=> "Glute Max,Calves",
            "tags"=> "Chair,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1081-tip-toe-squats-how-to-do-exercise"
        },
        355=> {
            "name"=> "Standing Cycling",
            "primary"=> "Glute Max,Hip Flexors,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: Cardio Machine",
            "tags"=> "Cardio,",
            "url"=> "https://www.skimble.com/exercises/2421-standing-cycling-how-to-do-exercise"
        },
        356=> {
            "name"=> "Standing Separate Leg Head to Knee Pose",
            "primary"=> "Side Shoulders,Lats,Glute Max,Hamstrings,Calves",
            "secondary"=> "Rear Shoulders,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2256-standing-separate-leg-head-to-knee-pose-how-to-do-exercise"
        },
        357=> {
            "name"=> "Skipping Drill",
            "primary"=> "Hip Flexors,Quads,Calves",
            "secondary"=> "Front Shoulders,Rear Shoulders,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "No Equipment,Warmup,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1742-skipping-drill-how-to-do-exercise"
        },
        358=> {
            "name"=> "Squat Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/901-squat-jumps-how-to-do-exercise"
        },
        359=> {
            "name"=> "Split Box Jumps",
            "primary"=> "Glute Max,Hip Flexors,Hamstrings,Calves,Plantar Flexors",
            "secondary"=> "Back Extensors",
            "tags"=> "Box or Step,Home Equipment,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/2370-split-box-jumps-how-to-do-exercise"
        },
        360=> {
            "name"=> "Skips in Place",
            "primary"=> "Quads,Calves",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "No Equipment,Warmup,Cooldown,Cardio",
            "url"=> "https://www.skimble.com/exercises/1023-skips-in-place-how-to-do-exercise"
        },
        361=> {
            "name"=> "Single Leg Touch Downs with Hop",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Front Shoulders,Lats,Lower Back,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1004-single-leg-touch-downs-with-hop-how-to-do-exercise"
        },
        362=> {
            "name"=> "Single Leg Squats",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Balance,Strength,",
            "url"=> "https://www.skimble.com/exercises/1154-single-leg-squats-how-to-do-exercise"
        },
        363=> {
            "name"=> "Split Squat Hops",
            "primary"=> "Quads,Hamstrings,Calves",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1157-split-squat-hops-how-to-do-exercise"
        },
        364=> {
            "name"=> "Standing Forward Bend",
            "primary"=> "Glute Max,Hamstrings,Calves,Lower Back",
            "secondary"=> "Required Equipment: Exercise Mat,No Equipment",
            "tags"=> "Warmup,Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/260-standing-forward-bend-how-to-do-exercise"
        },
        365=> {
            "name"=> "Stationary Biking",
            "primary"=> "Quads,Calves",
            "secondary"=> "Hip Flexors,Hamstrings",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/889-stationary-biking-how-to-do-exercise"
        },
        366=> {
            "name"=> "Treadmill Walking",
            "primary"=> "Quads,Hamstrings,Calves,Dorsiflexors,Plantar Flexors",
            "secondary"=> "Glute Max",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2431-treadmill-walking-how-to-do-exercise"
        },
        367=> {
            "name"=> "Tippy Toes",
            "primary"=> "Calves",
            "secondary"=> "Glute Max,Quads",
            "tags"=> "Chair,Warmup,Stretching",
            "url"=> "https://www.skimble.com/exercises/1080-tippy-toes-how-to-do-exercise"
        },
        368=> {
            "name"=> "Treadmill Walking Lunges",
            "primary"=> "Glute Max,Quads,Hamstrings,Calves",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2432-treadmill-walking-lunges-how-to-do-exercise"
        },
        369=> {
            "name"=> "Wall Calf Stretches",
            "primary"=> "Calves",
            "secondary"=> "Required Equipment: Wall",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/970-wall-calf-stretches-how-to-do-exercise"
        },
        370=> {
            "name"=> "Ball Reverse Crunches",
            "primary"=> "Front Shoulders,Lower Abs,Transverse Abdominis",
            "secondary"=> "Triceps,Lats,Neck Flexors",
            "tags"=> "Stability Ball,Home Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/414-ball-reverse-crunches-how-to-do-exercise"
        },
        371=> {
            "name"=> "Ball Torso Rotations",
            "primary"=> "Side Shoulders,Front Shoulders,Left Obliques,Right Obliques,Glute Max",
            "secondary"=> "Lats",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1307-ball-torso-rotations-how-to-do-exercise"
        },
        372=> {
            "name"=> "Angel Arms on Foam Roller",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Chest,Lower Back",
            "tags"=> "Foam Roller,Home Equipment,Stretching",
            "url"=> "https://www.skimble.com/exercises/1585-angel-arms-on-foam-roller-how-to-do-exercise"
        },
        373=> {
            "name"=> "Ball Plank with Leg Lifts",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Glute Max",
            "secondary"=> "Side Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Quads,Hamstrings",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1623-ball-plank-with-leg-lifts-how-to-do-exercise"
        },
        374=> {
            "name"=> "Backward Shoulder Rolls",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Chest",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1068-backward-shoulder-rolls-how-to-do-exercise"
        },
        375=> {
            "name"=> "5 Way Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1987-5-way-push-ups-how-to-do-exercise"
        },
        376=> {
            "name"=> "Ball Balance",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Transverse Abdominis,Adductors,Abductors",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1303-ball-balance-how-to-do-exercise"
        },
        377=> {
            "name"=> "Alternating Side Planks",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Upper Chest",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1134-alternating-side-planks-how-to-do-exercise"
        },
        378=> {
            "name"=> "Arm Pumps",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Rear Shoulders,Triceps,Lats",
            "tags"=> "No Equipment,Warmup,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/241-arm-pumps-how-to-do-exercise"
        },
        379=> {
            "name"=> "Ball Reverse Extensions",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Home Equipment,",
            "url"=> "https://www.skimble.com/exercises/2086-ball-reverse-extensions-how-to-do-exercise"
        },
        380=> {
            "name"=> "Ball Push-Ups",
            "primary"=> "Front Shoulders,Upper Chest,Lats",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1411-ball-push-ups-how-to-do-exercise"
        },
        381=> {
            "name"=> "Ball Tuck and Pike",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Lats",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/2380-ball-tuck-and-pike-how-to-do-exercise"
        },
        382=> {
            "name"=> "Ball Y-T-W-L",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Lower Back,Rhomboids,Rotator Cuff,Levator Scapula,Back Extensors",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Home Equipment,",
            "url"=> "https://www.skimble.com/exercises/2381-ball-y-t-w-l-how-to-do-exercise"
        },
        383=> {
            "name"=> "Ball Reaches on Foam Roller",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats",
            "secondary"=> "Required Equipment: Medicine Ball,Foam Roller",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1584-ball-reaches-on-foam-roller-how-to-do-exercise"
        },
        384=> {
            "name"=> "Ball Sways",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Lats",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1624-ball-sways-how-to-do-exercise"
        },
        385=> {
            "name"=> "Angel Arms",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Warmup,Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1342-angel-arms-how-to-do-exercise"
        },
        386=> {
            "name"=> "Ball Overhead Reach",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2378-ball-overhead-reach-how-to-do-exercise"
        },
        387=> {
            "name"=> "Alternating Cable Shoulder Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2274-alternating-cable-shoulder-press-how-to-do-exercise"
        },
        388=> {
            "name"=> "Band Front Raises",
            "primary"=> "Front Shoulders",
            "secondary"=> "Wrist Flexors",
            "tags"=> "Resistance Bands,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1988-band-front-raises-how-to-do-exercise"
        },
        389=> {
            "name"=> "Barbell Bench Press",
            "primary"=> "Front Shoulders,Triceps,Middle Chest",
            "secondary"=> "Side Shoulders,Upper Chest,Lower Chest",
            "tags"=> "Barbells,Bench,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/564-barbell-bench-press-how-to-do-exercise"
        },
        390=> {
            "name"=> "Bear Crawls",
            "primary"=> "Front Shoulders,Rear Shoulders,Triceps,Lats,Quads",
            "secondary"=> "Transverse Abdominis,Traps,Glute Max,Calves,Rhomboids",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/911-bear-crawls-how-to-do-exercise"
        },
        391=> {
            "name"=> "Big Forward Arm Circles",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Chest,Traps,Lats",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/873-big-forward-arm-circles-how-to-do-exercise"
        },
        392=> {
            "name"=> "BOSU Up and Over Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Rear Shoulders,Middle Chest",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/2036-bosu-up-and-over-plank-how-to-do-exercise"
        },
        393=> {
            "name"=> "Burpees",
            "primary"=> "Front Shoulders,Middle Chest,Glute Max,Quads,Hamstrings",
            "secondary"=> "Rear Shoulders,Triceps,Wrist Flexors,Upper Chest,Lower Chest,Upper Abs,Transverse Abdominis,Lats,Adductors,Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/255-burpees-how-to-do-exercise"
        },
        394=> {
            "name"=> "Cable Crossovers",
            "primary"=> "Front Shoulders,Middle Chest",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Exercise Machine,Strength,",
            "url"=> "https://www.skimble.com/exercises/887-cable-crossovers-how-to-do-exercise"
        },
        395=> {
            "name"=> "C Curve Punches",
            "primary"=> "Side Shoulders,Front Shoulders,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Transverse Abdominis",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2002-c-curve-punches-how-to-do-exercise"
        },
        396=> {
            "name"=> "Big Reverse Arm Circles",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest",
            "secondary"=> "Traps,Lats",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/874-big-reverse-arm-circles-how-to-do-exercise"
        },
        397=> {
            "name"=> "Boxer Fist Reaches",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/2147-boxer-fist-reaches-how-to-do-exercise"
        },
        398=> {
            "name"=> "Band Shoulder Press",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Rear Shoulders,Triceps,Biceps",
            "tags"=> "Resistance Bands,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1718-band-shoulder-press-how-to-do-exercise"
        },
        399=> {
            "name"=> "Barbell Clean and Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Upper Abs,Lower Abs,Traps,Lats,Glute Max,Quads,Hamstrings,Calves",
            "tags"=> "Barbells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1696-barbell-clean-and-press-how-to-do-exercise"
        },
        400=> {
            "name"=> "Bench Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Lower Back",
            "secondary"=> "Required Equipment: Bench",
            "tags"=> "Home Equipment,",
            "url"=> "https://www.skimble.com/exercises/2385-bench-plank-how-to-do-exercise"
        },
        401=> {
            "name"=> "Band Squats with Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max,Quads",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/1989-band-squats-with-press-how-to-do-exercise"
        },
        402=> {
            "name"=> "Barbell Incline Bench Press",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Upper Chest,Middle Chest",
            "secondary"=> "Required Equipment: Barbells,Bench",
            "tags"=> "Crossfit,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2329-barbell-incline-bench-press-how-to-do-exercise"
        },
        403=> {
            "name"=> "BOSU Up and Over Explosive Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Chest,Middle Chest,Lower Chest,Rhomboids",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/2037-bosu-up-and-over-explosive-push-ups-how-to-do-exercise"
        },
        404=> {
            "name"=> "Bird Dog on Fists",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Lower Back",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2240-bird-dog-on-fists-how-to-do-exercise"
        },
        405=> {
            "name"=> "Burpees on Step",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Box or Step",
            "tags"=> "Bodyweight,Home Equipment,Crossfit,Gym Equipment,",
            "url"=> "https://www.skimble.com/exercises/2376-burpees-on-step-how-to-do-exercise"
        },
        406=> {
            "name"=> "Camel",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Lats",
            "secondary"=> "Quads,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/950-camel-how-to-do-exercise"
        },
        407=> {
            "name"=> "Explosive Mountain Climbers",
            "primary"=> "Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1706-explosive-mountain-climbers-how-to-do-exercise"
        },
        408=> {
            "name"=> "Explosive Hamstring Sit-Up Rolls",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Glute Max",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1792-explosive-hamstring-sit-up-rolls-how-to-do-exercise"
        },
        409=> {
            "name"=> "Dumbbell Woodchops",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Transverse Abdominis,Quads",
            "secondary"=> "Left Obliques,Right Obliques,Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/928-dumbbell-woodchops-how-to-do-exercise"
        },
        410=> {
            "name"=> "Extended Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs",
            "secondary"=> "Upper Chest,Transverse Abdominis,Lower Back,Back Extensors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2084-extended-plank-how-to-do-exercise"
        },
        411=> {
            "name"=> "Dumbbell Push-Ups",
            "primary"=> "Front Shoulders,Triceps,Middle Chest,Transverse Abdominis",
            "secondary"=> "Lats,Rhomboids",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/801-dumbbell-push-ups-how-to-do-exercise"
        },
        412=> {
            "name"=> "Dumbbell Windmills",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Hamstrings",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2398-dumbbell-windmills-how-to-do-exercise"
        },
        413=> {
            "name"=> "Dumbbell V-Raises",
            "primary"=> "Front Shoulders",
            "secondary"=> "Rotator Cuff",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2211-dumbbell-v-raises-how-to-do-exercise"
        },
        414=> {
            "name"=> "Dumbbell Pull-over on a Ball",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats,Glute Max",
            "secondary"=> "Triceps,Upper Abs,Lower Abs,Transverse Abdominis,Lower Back",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1562-dumbbell-pull-over-on-a-ball-how-to-do-exercise"
        },
        415=> {
            "name"=> "Dumbbell Lunge and Rotation",
            "primary"=> "Side Shoulders,Front Shoulders,Left Obliques,Right Obliques,Quads",
            "secondary"=> "Glute Max,Adductors,Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/4-dumbbell-lunge-and-rotation-how-to-do-exercise"
        },
        416=> {
            "name"=> "Dumbbell Front Raises",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Triceps,Traps",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/799-dumbbell-front-raises-how-to-do-exercise"
        },
        417=> {
            "name"=> "Dumbbell Chest Press",
            "primary"=> "Front Shoulders,Rear Shoulders,Triceps,Middle Chest",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/975-dumbbell-chest-press-how-to-do-exercise"
        },
        418=> {
            "name"=> "Dumbbell Fly on Bench",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Pec Minor,Back Extensors",
            "secondary"=> "Rear Shoulders,Triceps,Biceps,Lower Chest,Rhomboids,Serratus Anterior,Rotator Cuff",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/957-dumbbell-fly-on-bench-how-to-do-exercise"
        },
        419=> {
            "name"=> "Downward Facing Deltoid Stretch",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Categories: Yoga,Stretching",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/3287-downward-facing-deltoid-stretch-how-to-do-exercise"
        },
        420=> {
            "name"=> "Dolphin Dog",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Rhomboids",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1277-dolphin-dog-how-to-do-exercise"
        },
        421=> {
            "name"=> "Dips with Leg Extension",
            "primary"=> "Front Shoulders,Triceps,Upper Abs",
            "secondary"=> "Lower Abs,Hip Flexors,Quads",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/270-dips-with-leg-extension-how-to-do-exercise"
        },
        422=> {
            "name"=> "Circle of Joy",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Wrist Flexors,Upper Chest",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/955-circle-of-joy-how-to-do-exercise"
        },
        423=> {
            "name"=> "Jabs",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Upper Chest",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1269-jabs-how-to-do-exercise"
        },
        424=> {
            "name"=> "Inchworm Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Wrist Flexors,Traps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/906-inchworm-push-ups-how-to-do-exercise"
        },
        425=> {
            "name"=> "Inverted Wall Push-Ups",
            "primary"=> "Front Shoulders,Triceps,Upper Chest,Middle Chest",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1708-inverted-wall-push-ups-how-to-do-exercise"
        },
        426=> {
            "name"=> "Freestyle Dancing",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Quads,Calves",
            "secondary"=> "Supinator,Hamstrings",
            "tags"=> "No Equipment,Dance",
            "url"=> "https://www.skimble.com/exercises/1013-freestyle-dancing-how-to-do-exercise"
        },
        427=> {
            "name"=> "Governators",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Biceps",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1061-governators-how-to-do-exercise"
        },
        428=> {
            "name"=> "First Yoga Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs",
            "secondary"=> "Triceps,Biceps,Supinator",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2271-first-yoga-plank-how-to-do-exercise"
        },
        429=> {
            "name"=> "Extended Plank Hold",
            "primary"=> "Side Shoulders,Front Shoulders,Transverse Abdominis",
            "secondary"=> "Upper Abs,Lower Abs,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2209-extended-plank-hold-how-to-do-exercise"
        },
        430=> {
            "name"=> "Inchworms",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs,Transverse Abdominis,Lower Back",
            "secondary"=> "Triceps,Wrist Flexors,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/939-inchworms-how-to-do-exercise"
        },
        431=> {
            "name"=> "Jab Cross Hook Elbow Left",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Wrist Flexors,Upper Chest",
            "tags"=> "No Equipment,Bodyweight,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1649-jab-cross-hook-elbow-left-how-to-do-exercise"
        },
        432=> {
            "name"=> "Jack Knife",
            "primary"=> "Front Shoulders,Upper Abs,Lower Abs,Glute Max",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1836-jack-knife-how-to-do-exercise"
        },
        433=> {
            "name"=> "Half Frog Pose",
            "primary"=> "Side Shoulders,Front Shoulders,Lower Abs,Quads,Neck Flexors",
            "secondary"=> "Upper Chest,Middle Chest",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1275-half-frog-pose-how-to-do-exercise"
        },
        434=> {
            "name"=> "Flexion Back Rows",
            "primary"=> "Front Shoulders,Upper Abs,Transverse Abdominis,Lower Back",
            "secondary"=> "Upper Chest,Middle Chest,Lower Chest,Rhomboids",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2116-flexion-back-rows-how-to-do-exercise"
        },
        435=> {
            "name"=> "Fast Rowing",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Quads,Rhomboids",
            "secondary"=> "Hamstrings,Calves,Lower Back",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1985-fast-rowing-how-to-do-exercise"
        },
        436=> {
            "name"=> "Good Morning Medicine Ball Catches",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Transverse Abdominis,Glute Max,Hamstrings,Lower Back",
            "secondary"=> "Triceps,Biceps,Lats,Rhomboids",
            "tags"=> "Medicine Ball,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/244-good-morning-medicine-ball-catches-how-to-do-exercise"
        },
        437=> {
            "name"=> "Forward Shoulder Rolls",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Chest",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1067-forward-shoulder-rolls-how-to-do-exercise"
        },
        438=> {
            "name"=> "Finger Tension Pulls",
            "primary"=> "Side Shoulders,Front Shoulders,Wrist Flexors,Wrist Extensors",
            "secondary"=> "Supinator,Upper Chest",
            "tags"=> "No Equipment,Warmup,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1059-finger-tension-pulls-how-to-do-exercise"
        },
        439=> {
            "name"=> "Horizontal Goblet Squats",
            "primary"=> "Front Shoulders,Glute Max,Quads,Hamstrings",
            "secondary"=> "Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/929-horizontal-goblet-squats-how-to-do-exercise"
        },
        440=> {
            "name"=> "Inclined Plane",
            "primary"=> "Side Shoulders,Front Shoulders,Transverse Abdominis,Glute Max",
            "secondary"=> "Triceps,Adductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/776-inclined-plane-how-to-do-exercise"
        },
        441=> {
            "name"=> "Jab Cross Hook Elbow Right",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Wrist Flexors,Upper Chest",
            "tags"=> "No Equipment,Bodyweight,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1629-jab-cross-hook-elbow-right-how-to-do-exercise"
        },
        442=> {
            "name"=> "Left Arm Reverse Dumbbell Fly",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Rhomboids,Back Extensors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2393-left-arm-reverse-dumbbell-fly-how-to-do-exercise"
        },
        443=> {
            "name"=> "Left Arm Kettlebell Swings",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Quads",
            "secondary"=> "Triceps,Transverse Abdominis,Traps,Hamstrings",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/1565-left-arm-kettlebell-swings-how-to-do-exercise"
        },
        444=> {
            "name"=> "Lateral to Front Raises",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Upper Chest,Middle Chest",
            "secondary"=> "Rear Shoulders,Lats,Back Extensors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2439-lateral-to-front-raises-how-to-do-exercise"
        },
        445=> {
            "name"=> "Kneeling Push-Ups",
            "primary"=> "Front Shoulders,Middle Chest",
            "secondary"=> "Side Shoulders,Rear Shoulders,Triceps",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/879-kneeling-push-ups-how-to-do-exercise"
        },
        446=> {
            "name"=> "Kettlebell Halo",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps",
            "secondary"=> "Triceps,Biceps,Supinator,Wrist Flexors",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1373-kettlebell-halo-how-to-do-exercise"
        },
        447=> {
            "name"=> "Kneeling Left Side Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Left Obliques,Glute Max",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Quads",
            "tags"=> "Exercise Mat,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1815-kneeling-left-side-plank-how-to-do-exercise"
        },
        448=> {
            "name"=> "Kettlebell Squat to Upright Row",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Kettlebells,Strength",
            "url"=> "https://www.skimble.com/exercises/2149-kettlebell-squat-to-upright-row-how-to-do-exercise"
        },
        449=> {
            "name"=> "Kettlebell Offset Press on Left Foot",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Glute Max,Abductors",
            "tags"=> "Kettlebells,Gym Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/2042-kettlebell-offset-press-on-left-foot-how-to-do-exercise"
        },
        450=> {
            "name"=> "Lateral Lunge and Shoulder Raise",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Dumbbells,Home Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/277-lateral-lunge-and-shoulder-raise-how-to-do-exercise"
        },
        451=> {
            "name"=> "Kneeling Spiderman",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis,Glute Max,Hip Flexors,Abductors,Knee Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2153-kneeling-spiderman-how-to-do-exercise"
        },
        452=> {
            "name"=> "Lateral Lunge with Shoulder Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Chest,Lats,Glute Max,Quads,Hamstrings",
            "secondary"=> "Middle Chest,Adductors,Abductors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2345-lateral-lunge-with-shoulder-press-how-to-do-exercise"
        },
        453=> {
            "name"=> "Lean-Over Hamstring and Back Stretch",
            "primary"=> "Front Shoulders,Hamstrings,Lower Back",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/463-lean-over-hamstring-and-back-stretch-how-to-do-exercise"
        },
        454=> {
            "name"=> "Kneeling One-Legged Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2458-kneeling-one-legged-push-ups-how-to-do-exercise"
        },
        455=> {
            "name"=> "Kettlebell Offset Press on Right Foot",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Glute Max,Abductors",
            "tags"=> "Kettlebells,Gym Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/2043-kettlebell-offset-press-on-right-foot-how-to-do-exercise"
        },
        456=> {
            "name"=> "Kettlebell Strict Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2041-kettlebell-strict-press-how-to-do-exercise"
        },
        457=> {
            "name"=> "Left Hooks",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Triceps,Biceps",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1190-left-hooks-how-to-do-exercise"
        },
        458=> {
            "name"=> "Left Elbow Swings",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Elbow Flexors",
            "tags"=> "No Equipment,Bodyweight,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1628-left-elbow-swings-how-to-do-exercise"
        },
        459=> {
            "name"=> "Left Kettlebell Swings",
            "primary"=> "Front Shoulders,Lats,Glute Max,Quads",
            "secondary"=> "Wrist Flexors,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1607-left-kettlebell-swings-how-to-do-exercise"
        },
        460=> {
            "name"=> "Left Waiter's Walk",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "Kettlebells,Crossfit,Stretching,Strength",
            "url"=> "https://www.skimble.com/exercises/5379-left-waiters-walk-how-to-do-exercise"
        },
        461=> {
            "name"=> "Man Makers",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Glute Max,Quads",
            "secondary"=> "Biceps,Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Crossfit,Stretching,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/5073-man-makers-how-to-do-exercise"
        },
        462=> {
            "name"=> "Medicine Ball Chops",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: Medicine Ball",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/1962-medicine-ball-chops-how-to-do-exercise"
        },
        463=> {
            "name"=> "Left Turkish Get-ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Lats,Quads,Hamstrings",
            "secondary"=> "Triceps,Upper Abs,Lower Abs,Left Obliques",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/844-left-turkish-get-ups-how-to-do-exercise"
        },
        464=> {
            "name"=> "Left Warrior 1 with Eagle Arms",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1932-left-warrior-1-with-eagle-arms-how-to-do-exercise"
        },
        465=> {
            "name"=> "Left Jabs",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Biceps",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1188-left-jabs-how-to-do-exercise"
        },
        466=> {
            "name"=> "Left Knee to Chest",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2068-left-knee-to-chest-how-to-do-exercise"
        },
        467=> {
            "name"=> "Left Low Lunge with Clasped Hands",
            "primary"=> "Front Shoulders,Rear Shoulders,Glute Max,Hip Flexors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1920-left-low-lunge-with-clasped-hands-how-to-do-exercise"
        },
        468=> {
            "name"=> "Left Cross Leg Obliques",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Transverse Abdominis,Hip Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2158-left-cross-leg-obliques-how-to-do-exercise"
        },
        469=> {
            "name"=> "Left Kettlebell Squat Clean Thrusters",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Quads,Lower Back",
            "secondary"=> "Triceps,Transverse Abdominis,Traps,Hamstrings",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/1563-left-kettlebell-squat-clean-thrusters-how-to-do-exercise"
        },
        470=> {
            "name"=> "Left High Lunge Sidebend",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Quads",
            "secondary"=> "Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1908-left-high-lunge-sidebend-how-to-do-exercise"
        },
        471=> {
            "name"=> "Left Crosses",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Biceps",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1194-left-crosses-how-to-do-exercise"
        },
        472=> {
            "name"=> "Left Lunge with Kettlebell Raise",
            "primary"=> "Front Shoulders,Glute Max,Quads",
            "secondary"=> "Upper Chest,Traps,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1555-left-lunge-with-kettlebell-raise-how-to-do-exercise"
        },
        473=> {
            "name"=> "Left Leg Balance and L-lift with Band",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Abductors",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "Resistance Bands,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/2125-left-leg-balance-and-l-lift-with-band-how-to-do-exercise"
        },
        474=> {
            "name"=> "Medicine Ball Offset Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Transverse Abdominis",
            "secondary"=> "Triceps,Biceps,Wrist Flexors,Transverse Abdominis",
            "tags"=> "Medicine Ball,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1961-medicine-ball-offset-push-ups-how-to-do-exercise"
        },
        475=> {
            "name"=> "Plank Ball Pass with Partner",
            "primary"=> "Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Triceps,Upper Chest,Middle Chest,Glute Max,Quads",
            "tags"=> "Medicine Ball,Home Equipment,Partner",
            "url"=> "https://www.skimble.com/exercises/1573-plank-ball-pass-with-partner-how-to-do-exercise"
        },
        476=> {
            "name"=> "Opposite Elbow to Knee Side Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Hip Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2030-opposite-elbow-to-knee-side-plank-how-to-do-exercise"
        },
        477=> {
            "name"=> "Overhead Dumbbell Hold",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2399-overhead-dumbbell-hold-how-to-do-exercise"
        },
        478=> {
            "name"=> "Pec Opener",
            "primary"=> "Front Shoulders,Upper Chest",
            "secondary"=> "Side Shoulders,Lats,Rhomboids",
            "tags"=> "Exercise Mat,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1146-pec-opener-how-to-do-exercise"
        },
        479=> {
            "name"=> "Mountain Climbers",
            "primary"=> "Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Lats,Quads,Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/798-mountain-climbers-how-to-do-exercise"
        },
        480=> {
            "name"=> "Plank High Fives",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Partner,",
            "url"=> "https://www.skimble.com/exercises/1660-plank-high-fives-how-to-do-exercise"
        },
        481=> {
            "name"=> "Moderate Rowing",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats,Rhomboids",
            "secondary"=> "Quads,Hamstrings,Calves",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1984-moderate-rowing-how-to-do-exercise"
        },
        482=> {
            "name"=> "Medicine Ball Side Step Squat to Press",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Glute Max,Quads,Hamstrings,Abductors",
            "secondary"=> "Required Equipment: Medicine Ball",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1964-medicine-ball-side-step-squat-to-press-how-to-do-exercise"
        },
        483=> {
            "name"=> "Opposite Knee Mountain Climber",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Hip Flexors,Quads,Hamstrings,Knee Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2218-opposite-knee-mountain-climber-how-to-do-exercise"
        },
        484=> {
            "name"=> "Pilates Left Side Bends",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1695-pilates-left-side-bends-how-to-do-exercise"
        },
        485=> {
            "name"=> "Overhead Squat with Ball",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1299-overhead-squat-with-ball-how-to-do-exercise"
        },
        486=> {
            "name"=> "Noose Pose",
            "primary"=> "Side Shoulders,Front Shoulders,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Glute Max,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1806-noose-pose-how-to-do-exercise"
        },
        487=> {
            "name"=> "Mountain Climbers on BOSU Back",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Required Equipment: BOSU",
            "tags"=> "Bodyweight,Gym Equipment,Balance,",
            "url"=> "https://www.skimble.com/exercises/1204-mountain-climbers-on-bosu-back-how-to-do-exercise"
        },
        488=> {
            "name"=> "Plank with Arm Lifts",
            "primary"=> "Front Shoulders,Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs",
            "secondary"=> "Side Shoulders,Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2006-plank-with-arm-lifts-how-to-do-exercise"
        },
        489=> {
            "name"=> "Medicine Ball Slams",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Lats",
            "secondary"=> "Wrist Flexors,Upper Chest,Middle Chest,Lower Chest,Transverse Abdominis",
            "tags"=> "Medicine Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/83-medicine-ball-slams-how-to-do-exercise"
        },
        490=> {
            "name"=> "Overhead Barbell Walk",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Left Obliques,Right Obliques,Lower Back,Rotator Cuff",
            "secondary"=> "Required Equipment: Barbells",
            "tags"=> "Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/1678-overhead-barbell-walk-how-to-do-exercise"
        },
        491=> {
            "name"=> "Pilates Right Side Bends",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1694-pilates-right-side-bends-how-to-do-exercise"
        },
        492=> {
            "name"=> "Partner Plank Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest",
            "secondary"=> "Triceps,Biceps,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/1574-partner-plank-push-ups-how-to-do-exercise"
        },
        493=> {
            "name"=> "Medicine Ball Soccer Throw",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Traps,Rhomboids",
            "tags"=> "Medicine Ball,Strength",
            "url"=> "https://www.skimble.com/exercises/2033-medicine-ball-soccer-throw-how-to-do-exercise"
        },
        494=> {
            "name"=> "Right Crosses",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Biceps",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1193-right-crosses-how-to-do-exercise"
        },
        495=> {
            "name"=> "Push-Ups with Hands on Ball",
            "primary"=> "Front Shoulders,Upper Chest,Middle Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Home Equipment,Balance,",
            "url"=> "https://www.skimble.com/exercises/1410-push-ups-with-hands-on-ball-how-to-do-exercise"
        },
        496=> {
            "name"=> "Rear Shoulder Fly with Band",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Traps,Rhomboids",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2350-rear-shoulder-fly-with-band-how-to-do-exercise"
        },
        497=> {
            "name"=> "Plank with Dumbbell Arm Lifts",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Upper Chest,Middle Chest,Lower Chest,Left Obliques,Right Obliques,Serratus Anterior",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2403-plank-with-dumbbell-arm-lifts-how-to-do-exercise"
        },
        498=> {
            "name"=> "Puppy Pose",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Chest",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1276-puppy-pose-how-to-do-exercise"
        },
        499=> {
            "name"=> "Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Chest,Middle Chest,Lower Chest,Rhomboids",
            "secondary"=> "Biceps,Wrist Flexors",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/266-push-ups-how-to-do-exercise"
        },
        500=> {
            "name"=> "Right Elbow Swings",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Elbow Flexors",
            "tags"=> "No Equipment,Bodyweight,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1627-right-elbow-swings-how-to-do-exercise"
        },
        501=> {
            "name"=> "Reverse Elbow Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Triceps,Biceps,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1680-reverse-elbow-plank-how-to-do-exercise"
        },
        502=> {
            "name"=> "Right Arm Reverse Dumbbell Fly",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Rhomboids,Back Extensors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2394-right-arm-reverse-dumbbell-fly-how-to-do-exercise"
        },
        503=> {
            "name"=> "Push-Ups on BOSU",
            "primary"=> "Front Shoulders,Upper Chest,Middle Chest,Lower Chest,Rhomboids",
            "secondary"=> "Rear Shoulders,Triceps,Biceps,Wrist Flexors,Upper Abs,Transverse Abdominis",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1181-push-ups-on-bosu-how-to-do-exercise"
        },
        504=> {
            "name"=> "Push-Ups with Lateral Raise",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Middle Chest,Transverse Abdominis,Lats",
            "secondary"=> "Wrist Flexors,Left Obliques,Right Obliques",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/438-push-ups-with-lateral-raise-how-to-do-exercise"
        },
        505=> {
            "name"=> "Power Punches",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1202-power-punches-how-to-do-exercise"
        },
        506=> {
            "name"=> "Push Up Pull Throughs",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Dance,",
            "url"=> "https://www.skimble.com/exercises/2156-push-up-pull-throughs-how-to-do-exercise"
        },
        507=> {
            "name"=> "Right Cross Leg Obliques",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Right Obliques,Transverse Abdominis,Hip Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2157-right-cross-leg-obliques-how-to-do-exercise"
        },
        508=> {
            "name"=> "Reverse Table Top",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max",
            "secondary"=> "Triceps,Biceps,Supinator",
            "tags"=> "Exercise Mat,Yoga,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2026-reverse-table-top-how-to-do-exercise"
        },
        509=> {
            "name"=> "Push-Ups with Rotations",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2344-push-ups-with-rotations-how-to-do-exercise"
        },
        510=> {
            "name"=> "Push-Up Bird Dog",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Left Obliques,Right Obliques,Lats,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2154-push-up-bird-dog-how-to-do-exercise"
        },
        511=> {
            "name"=> "Push-ups on the BOSU Back",
            "primary"=> "Front Shoulders,Upper Chest,Middle Chest,Lower Chest,Rhomboids",
            "secondary"=> "Rear Shoulders,Triceps,Biceps,Wrist Flexors,Upper Abs,Transverse Abdominis",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1182-push-ups-on-the-bosu-back-how-to-do-exercise"
        },
        512=> {
            "name"=> "Pull Throughs",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Dance,",
            "url"=> "https://www.skimble.com/exercises/2155-pull-throughs-how-to-do-exercise"
        },
        513=> {
            "name"=> "Rotational Shoulder Presses",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Supinator,Elbow Flexors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2336-rotational-shoulder-presses-how-to-do-exercise"
        },
        514=> {
            "name"=> "Ring Alligator Push-Ups",
            "primary"=> "Front Shoulders,Triceps,Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs",
            "secondary"=> "Biceps,Glute Max",
            "tags"=> "Rings,Crossfit,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5376-ring-alligator-push-ups-how-to-do-exercise"
        },
        515=> {
            "name"=> "Rocking Bow",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Upper Abs,Transverse Abdominis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Pilates,",
            "url"=> "https://www.skimble.com/exercises/1115-rocking-bow-how-to-do-exercise"
        },
        516=> {
            "name"=> "Right Waiter's Walk",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5378-right-waiters-walk-how-to-do-exercise"
        },
        517=> {
            "name"=> "Right Kettlebell Swings",
            "primary"=> "Front Shoulders,Lats,Glute Max,Quads",
            "secondary"=> "Wrist Flexors,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1606-right-kettlebell-swings-how-to-do-exercise"
        },
        518=> {
            "name"=> "Right Jabs",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Biceps",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1187-right-jabs-how-to-do-exercise"
        },
        519=> {
            "name"=> "Right Hooks",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Triceps,Biceps",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1189-right-hooks-how-to-do-exercise"
        },
        520=> {
            "name"=> "Right Turkish Get-ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats,Glute Max,Quads,Hamstrings",
            "secondary"=> "Triceps,Upper Abs,Lower Abs,Right Obliques",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/843-right-turkish-get-ups-how-to-do-exercise"
        },
        521=> {
            "name"=> "Right Knee to Chest",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2029-right-knee-to-chest-how-to-do-exercise"
        },
        522=> {
            "name"=> "Right Low Lunge with Clasped Hands",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Hip Flexors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1919-right-low-lunge-with-clasped-hands-how-to-do-exercise"
        },
        523=> {
            "name"=> "Right Warrior 1 with Eagle Arms",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max,Quads,Rhomboids",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1931-right-warrior-1-with-eagle-arms-how-to-do-exercise"
        },
        524=> {
            "name"=> "Ring Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Upper Chest,Middle Chest,Lower Chest,Rhomboids",
            "secondary"=> "Biceps,Wrist Flexors",
            "tags"=> "Rings,Crossfit,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5371-ring-push-ups-how-to-do-exercise"
        },
        525=> {
            "name"=> "Rowing",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Glute Max,Hip Flexors,Quads,Hamstrings,Rhomboids",
            "secondary"=> "Triceps,Biceps,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Back Extensors",
            "tags"=> "Cardio Machine,Exercise Machine,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/849-rowing-how-to-do-exercise"
        },
        526=> {
            "name"=> "Rotating Elbow Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Upper Chest",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1165-rotating-elbow-plank-how-to-do-exercise"
        },
        527=> {
            "name"=> "Ring Rotating Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Biceps,Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs,Glute Max",
            "tags"=> "Rings,Crossfit,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5377-ring-rotating-push-ups-how-to-do-exercise"
        },
        528=> {
            "name"=> "Right Warrior 3",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats,Glute Max,Hamstrings",
            "secondary"=> "Upper Abs,Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/973-right-warrior-3-how-to-do-exercise"
        },
        529=> {
            "name"=> "Right Leg Balance and L-lift with Band",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Abductors",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "Resistance Bands,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/2126-right-leg-balance-and-l-lift-with-band-how-to-do-exercise"
        },
        530=> {
            "name"=> "Right Kettlebell Squat Clean Thrusters",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Quads,Lower Back",
            "secondary"=> "Triceps,Transverse Abdominis,Traps,Hamstrings",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/1564-right-kettlebell-squat-clean-thrusters-how-to-do-exercise"
        },
        531=> {
            "name"=> "Right Lunge with Kettlebell Raise",
            "primary"=> "Front Shoulders,Glute Max,Quads",
            "secondary"=> "Upper Chest,Traps,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1551-right-lunge-with-kettlebell-raise-how-to-do-exercise"
        },
        532=> {
            "name"=> "Seal Jacks",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Chest,Quads,Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/976-seal-jacks-how-to-do-exercise"
        },
        533=> {
            "name"=> "Seated Dumbbell Press",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Upper Chest",
            "tags"=> "Dumbbells,Chair,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1369-seated-dumbbell-press-how-to-do-exercise"
        },
        534=> {
            "name"=> "Shoulder Opener with Band",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Rhomboids",
            "tags"=> "Resistance Bands,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1720-shoulder-opener-with-band-how-to-do-exercise"
        },
        535=> {
            "name"=> "Sideways Bow Pose",
            "primary"=> "Front Shoulders,Upper Chest,Upper Abs,Transverse Abdominis,Quads",
            "secondary"=> "Side Shoulders,Rear Shoulders,Lats",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1148-sideways-bow-pose-how-to-do-exercise"
        },
        536=> {
            "name"=> "Skips with Backward Arm Circles",
            "primary"=> "Front Shoulders,Rear Shoulders",
            "secondary"=> "Quads,Hamstrings,Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1747-skips-with-backward-arm-circles-how-to-do-exercise"
        },
        537=> {
            "name"=> "Spiderman Push-Ups",
            "primary"=> "Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Quads,Hamstrings,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1043-spiderman-push-ups-how-to-do-exercise"
        },
        538=> {
            "name"=> "Squats with Ball Reaches",
            "primary"=> "Side Shoulders,Front Shoulders,Left Obliques,Right Obliques,Quads",
            "secondary"=> "Glute Max",
            "tags"=> "Stability Ball,Strength",
            "url"=> "https://www.skimble.com/exercises/1255-squats-with-ball-reaches-how-to-do-exercise"
        },
        539=> {
            "name"=> "Squats to Shoulder Press with Band",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max,Quads",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Home Equipment,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1721-squats-to-shoulder-press-with-band-how-to-do-exercise"
        },
        540=> {
            "name"=> "Skiers on Stability Ball",
            "primary"=> "Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Triceps,Wrist Flexors,Quads,Neck Flexors",
            "tags"=> "Stability Ball,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1545-skiers-on-stability-ball-how-to-do-exercise"
        },
        541=> {
            "name"=> "Spine Twisting Pose",
            "primary"=> "Front Shoulders,Upper Chest,Middle Chest",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2267-spine-twisting-pose-how-to-do-exercise"
        },
        542=> {
            "name"=> "Small Forward Arm Circles",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/876-small-forward-arm-circles-how-to-do-exercise"
        },
        543=> {
            "name"=> "Seated Eagle Arms",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Rhomboids",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1942-seated-eagle-arms-how-to-do-exercise"
        },
        544=> {
            "name"=> "Shoulder Shrugs",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1065-shoulder-shrugs-how-to-do-exercise"
        },
        545=> {
            "name"=> "Single Arm Dumbbell Swings",
            "primary"=> "Front Shoulders,Lats,Glute Max,Hamstrings",
            "secondary"=> "Quads",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/674-single-arm-dumbbell-swings-how-to-do-exercise"
        },
        546=> {
            "name"=> "Single Dumbbell Front Raises",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Triceps,Traps",
            "tags"=> "Dumbbells,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1449-single-dumbbell-front-raises-how-to-do-exercise"
        },
        547=> {
            "name"=> "Side to Side Elbow Plank on Ball",
            "primary"=> "Side Shoulders,Front Shoulders,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Upper Chest,Middle Chest,Glute Max,Lower Back",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1571-side-to-side-elbow-plank-on-ball-how-to-do-exercise"
        },
        548=> {
            "name"=> "Shadow Boxing",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1092-shadow-boxing-how-to-do-exercise"
        },
        549=> {
            "name"=> "Small Reverse Arm Circles",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/875-small-reverse-arm-circles-how-to-do-exercise"
        },
        550=> {
            "name"=> "Split Squat Ball Toss",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max,Quads",
            "secondary"=> "Left Obliques,Right Obliques,Hamstrings",
            "tags"=> "Medicine Ball,Home Equipment,Gym Equipment,Strength,Partner",
            "url"=> "https://www.skimble.com/exercises/1579-split-squat-ball-toss-how-to-do-exercise"
        },
        551=> {
            "name"=> "Skips with Arm Circles",
            "primary"=> "Front Shoulders,Rear Shoulders",
            "secondary"=> "Quads,Hamstrings,Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1746-skips-with-arm-circles-how-to-do-exercise"
        },
        552=> {
            "name"=> "Stability Ball Chest Press with Glute Raises",
            "primary"=> "Front Shoulders,Upper Chest,Middle Chest,Glute Max",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "Dumbbells,Stability Ball,Strength",
            "url"=> "https://www.skimble.com/exercises/1404-stability-ball-chest-press-with-glute-raises-how-to-do-exercise"
        },
        553=> {
            "name"=> "Vertical Goblet Squats",
            "primary"=> "Front Shoulders,Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/665-vertical-goblet-squats-how-to-do-exercise"
        },
        554=> {
            "name"=> "T's",
            "primary"=> "Side Shoulders,Front Shoulders",
            "secondary"=> "Rear Shoulders,Upper Chest,Middle Chest",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1020-ts-how-to-do-exercise"
        },
        555=> {
            "name"=> "Thread the Needles",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats",
            "secondary"=> "Supinator,Upper Chest,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1034-thread-the-needles-how-to-do-exercise"
        },
        556=> {
            "name"=> "Uneven Loaded Walk with Right Arm",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Required Equipment: Sandbags",
            "tags"=> "Home Equipment,Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/332-uneven-loaded-walk-with-right-arm-how-to-do-exercise"
        },
        557=> {
            "name"=> "Strike Downs",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Home Equipment,Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1690-strike-downs-how-to-do-exercise"
        },
        558=> {
            "name"=> "Statue of Dumbbell",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1169-statue-of-dumbbell-how-to-do-exercise"
        },
        559=> {
            "name"=> "Stability Ball Knee Tucks",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs",
            "secondary"=> "Triceps,Transverse Abdominis,Lats,Quads",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/883-stability-ball-knee-tucks-how-to-do-exercise"
        },
        560=> {
            "name"=> "Surfees",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis,Glute Max,Quads",
            "secondary"=> "Side Shoulders",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2152-surfees-how-to-do-exercise"
        },
        561=> {
            "name"=> "The Bollywood Hula",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Quads",
            "secondary"=> "Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "tags"=> "No Equipment,Dance",
            "url"=> "https://www.skimble.com/exercises/1114-the-bollywood-hula-how-to-do-exercise"
        },
        562=> {
            "name"=> "Straight Arm Lateral Raise with Band",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back",
            "tags"=> "Resistance Bands,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2346-straight-arm-lateral-raise-with-band-how-to-do-exercise"
        },
        563=> {
            "name"=> "Thrusters",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats,Glute Max,Quads,Hamstrings",
            "secondary"=> "Triceps,Transverse Abdominis,Lower Back",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/845-thrusters-how-to-do-exercise"
        },
        564=> {
            "name"=> "Upper Cuts",
            "primary"=> "Front Shoulders,Rear Shoulders,Biceps,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1270-upper-cuts-how-to-do-exercise"
        },
        565=> {
            "name"=> "Uneven Loaded Walk with Left Arm",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "secondary"=> "Required Equipment: Sandbags",
            "tags"=> "Home Equipment,Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/443-uneven-loaded-walk-with-left-arm-how-to-do-exercise"
        },
        566=> {
            "name"=> "Upward Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Transverse Abdominis,Glute Max",
            "secondary"=> "Triceps,Adductors",
            "tags"=> "Exercise Mat,No Equipment,Cooldown,Yoga,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/370-upward-plank-how-to-do-exercise"
        },
        567=> {
            "name"=> "The Wheelbarrow",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Partner,",
            "url"=> "https://www.skimble.com/exercises/1705-the-wheelbarrow-how-to-do-exercise"
        },
        568=> {
            "name"=> "Stability Ball Plank with Tap Offs",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Wrist Flexors,Upper Chest,Middle Chest",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1583-stability-ball-plank-with-tap-offs-how-to-do-exercise"
        },
        569=> {
            "name"=> "Swimming",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Glute Max,Quads,Hamstrings,Rhomboids",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Crossfit,",
            "url"=> "https://www.skimble.com/exercises/1356-swimming-how-to-do-exercise"
        },
        570=> {
            "name"=> "Straight Punches",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Chest",
            "secondary"=> "Triceps,Supinator,Wrist Flexors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1801-straight-punches-how-to-do-exercise"
        },
        571=> {
            "name"=> "Wall Tricep Push-Ups",
            "primary"=> "Front Shoulders,Triceps,Upper Chest,Middle Chest,Lower Chest,Transverse Abdominis,Rhomboids",
            "secondary"=> "Rear Shoulders,Lower Back",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1009-wall-tricep-push-ups-how-to-do-exercise"
        },
        572=> {
            "name"=> "Walking High Knees",
            "primary"=> "Front Shoulders,Hip Flexors,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Running,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1799-walking-high-knees-how-to-do-exercise"
        },
        573=> {
            "name"=> "Wall Ball Squats with Ball Raises",
            "primary"=> "Side Shoulders,Front Shoulders,Glute Max,Quads",
            "secondary"=> "Left Obliques,Right Obliques,Transverse Abdominis,Adductors,Hamstrings",
            "tags"=> "Stability Ball,Medicine Ball,Wall,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1409-wall-ball-squats-with-ball-raises-how-to-do-exercise"
        },
        574=> {
            "name"=> "Y-T-A",
            "primary"=> "Front Shoulders,Rear Shoulders,Traps,Lats,Rhomboids",
            "secondary"=> "Glute Max,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/917-y-t-a-how-to-do-exercise"
        },
        575=> {
            "name"=> "Wide Leg Forward Bend C",
            "primary"=> "Front Shoulders,Rear Shoulders,Traps,Lats,Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/2295-wide-leg-forward-bend-c-how-to-do-exercise"
        },
        576=> {
            "name"=> "Yoga Plank",
            "primary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs",
            "secondary"=> "Triceps,Biceps,Supinator",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2270-yoga-plank-how-to-do-exercise"
        },
        577=> {
            "name"=> "Yoga Shoulder Shrugs",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/4789-yoga-shoulder-shrugs-how-to-do-exercise"
        },
        578=> {
            "name"=> "Windmills",
            "primary"=> "Side Shoulders,Front Shoulders,Wrist Flexors",
            "secondary"=> "Upper Chest,Lats",
            "tags"=> "No Equipment,Warmup,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1364-windmills-how-to-do-exercise"
        },
        579=> {
            "name"=> "Wheel Pose",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Lower Chest,Traps,Lats,Quads",
            "secondary"=> "Transverse Abdominis,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/987-wheel-pose-how-to-do-exercise"
        },
        580=> {
            "name"=> "Warm Up Rowing",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats,Rhomboids",
            "secondary"=> "Quads,Hamstrings,Calves",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1983-warm-up-rowing-how-to-do-exercise"
        },
        581=> {
            "name"=> "Walking Inchworms",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Traps,Glute Max,Lower Back",
            "secondary"=> "Biceps,Wrist Flexors,Upper Chest,Transverse Abdominis,Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1675-walking-inchworms-how-to-do-exercise"
        },
        582=> {
            "name"=> "Wall Plank",
            "primary"=> "Front Shoulders,Triceps,Upper Chest,Transverse Abdominis",
            "secondary"=> "Required Equipment: Wall",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1450-wall-plank-how-to-do-exercise"
        },
        583=> {
            "name"=> "Wall Ball Shots",
            "primary"=> "Front Shoulders,Middle Chest",
            "secondary"=> "Required Equipment: Medicine Ball,Wall",
            "tags"=> "Crossfit,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/836-wall-ball-shots-how-to-do-exercise"
        },
        584=> {
            "name"=> "Chaturanga Run",
            "primary"=> "Triceps,Wrist Flexors,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Biceps,Adductors,Quads",
            "tags"=> "Exercise Mat,Yoga,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1722-chaturanga-run-how-to-do-exercise"
        },
        585=> {
            "name"=> "Forearm Flexor Rolls",
            "primary"=> "Wrist Flexors",
            "secondary"=> "",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/2449-forearm-flexor-rolls-how-to-do-exercise"
        },
        586=> {
            "name"=> "Neutral Grip Hang",
            "primary"=> "Wrist Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders",
            "tags"=> "Pull Up Bar,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/1957-neutral-grip-hang-how-to-do-exercise"
        },
        587=> {
            "name"=> "Outward Wrist Circles",
            "primary"=> "Wrist Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1069-outward-wrist-circles-how-to-do-exercise"
        },
        588=> {
            "name"=> "Finger Tension Squeezes",
            "primary"=> "Wrist Flexors,Wrist Extensors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1058-finger-tension-squeezes-how-to-do-exercise"
        },
        589=> {
            "name"=> "Gorilla",
            "primary"=> "Supinator,Wrist Flexors,Hamstrings",
            "secondary"=> "Lats,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1609-gorilla-how-to-do-exercise"
        },
        590=> {
            "name"=> "Dumbbell Wrist Curls",
            "primary"=> "Wrist Flexors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2442-dumbbell-wrist-curls-how-to-do-exercise"
        },
        591=> {
            "name"=> "Crow",
            "primary"=> "Triceps,Supinator,Wrist Flexors,Upper Abs",
            "secondary"=> "Lats,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1264-crow-how-to-do-exercise"
        },
        592=> {
            "name"=> "Ball Wheel",
            "primary"=> "Wrist Flexors,Glute Max,Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Lats,Lower Back",
            "tags"=> "Stability Ball,Yoga",
            "url"=> "https://www.skimble.com/exercises/1621-ball-wheel-how-to-do-exercise"
        },
        593=> {
            "name"=> "Hang",
            "primary"=> "Wrist Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Pull Up Bar,Home Equipment,Rock Climbing",
            "url"=> "https://www.skimble.com/exercises/1956-hang-how-to-do-exercise"
        },
        594=> {
            "name"=> "Fist Bumps",
            "primary"=> "Supinator,Wrist Flexors",
            "secondary"=> "Front Shoulders",
            "tags"=> "No Equipment,Cooldown",
            "url"=> "https://www.skimble.com/exercises/1014-fist-bumps-how-to-do-exercise"
        },
        595=> {
            "name"=> "Inward Wrist Circles",
            "primary"=> "Wrist Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1072-inward-wrist-circles-how-to-do-exercise"
        },
        596=> {
            "name"=> "Left Lateral Kettlebell Swings",
            "primary"=> "Side Shoulders,Wrist Flexors,Glute Max,Quads,Hamstrings",
            "secondary"=> "Supinator,Wrist Flexors,Left Obliques,Right Obliques",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/1368-left-lateral-kettlebell-swings-how-to-do-exercise"
        },
        597=> {
            "name"=> "Rapid Punches",
            "primary"=> "Supinator,Wrist Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1201-rapid-punches-how-to-do-exercise"
        },
        598=> {
            "name"=> "Wrist Extensor Stretches",
            "primary"=> "Supinator,Wrist Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Stretching,",
            "url"=> "https://www.skimble.com/exercises/143-wrist-extensor-stretches-how-to-do-exercise"
        },
        599=> {
            "name"=> "Underhand Wrist Flexor Stretches",
            "primary"=> "Supinator,Wrist Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1076-underhand-wrist-flexor-stretches-how-to-do-exercise"
        },
        600=> {
            "name"=> "Yoga Finger Stretches",
            "primary"=> "Wrist Flexors",
            "secondary"=> "Categories: Yoga,Stretching",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/3289-yoga-finger-stretches-how-to-do-exercise"
        },
        601=> {
            "name"=> "Wrist Stretches II",
            "primary"=> "Wrist Flexors",
            "secondary"=> "Wrist Extensors",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3291-wrist-stretches-ii-how-to-do-exercise"
        },
        602=> {
            "name"=> "The Namaste Groove",
            "primary"=> "Wrist Flexors,Left Obliques,Right Obliques",
            "secondary"=> "Triceps,Supinator,Upper Abs,Right Obliques",
            "tags"=> "No Equipment,Dance",
            "url"=> "https://www.skimble.com/exercises/1131-the-namaste-groove-how-to-do-exercise"
        },
        603=> {
            "name"=> "Wrist Flexor Stretches",
            "primary"=> "Supinator,Wrist Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1077-wrist-flexor-stretches-how-to-do-exercise"
        },
        604=> {
            "name"=> "Twisted Arm & Shoulder Stretches",
            "primary"=> "Supinator,Wrist Flexors",
            "secondary"=> "Side Shoulders",
            "tags"=> "No Equipment,Warmup,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1060-twisted-arm-shoulder-stretches-how-to-do-exercise"
        },
        605=> {
            "name"=> "Wrist Stretches I",
            "primary"=> "Wrist Flexors,Wrist Extensors",
            "secondary"=> "Categories: Yoga,Stretching",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/3290-wrist-stretches-i-how-to-do-exercise"
        },
        606=> {
            "name"=> "1 2 Burpees",
            "primary"=> "Triceps,Upper Chest,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1797-1-2-burpees-how-to-do-exercise"
        },
        607=> {
            "name"=> "Alternate Nostril Breathing",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1596-alternate-nostril-breathing-how-to-do-exercise"
        },
        608=> {
            "name"=> "Bent Elbow Pec Stretch",
            "primary"=> "Upper Chest,Middle Chest",
            "secondary"=> "Lower Chest,Pec Minor",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3012-bent-elbow-pec-stretch-how-to-do-exercise"
        },
        609=> {
            "name"=> "Bench Dumbbell Fly",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Dumbbells,Bench,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/2341-bench-dumbbell-fly-how-to-do-exercise"
        },
        610=> {
            "name"=> "Crescent Lunges",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Quads,Neck Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/940-crescent-lunges-how-to-do-exercise"
        },
        611=> {
            "name"=> "Chest Openers",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Cooldown,Bodyweight,Home Equipment,Stretching",
            "url"=> "https://www.skimble.com/exercises/1054-chest-openers-how-to-do-exercise"
        },
        612=> {
            "name"=> "Diamond Push-Ups",
            "primary"=> "Triceps,Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Front Shoulders,Transverse Abdominis,Lats,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/364-diamond-push-ups-how-to-do-exercise"
        },
        613=> {
            "name"=> "Bench Dumbbell Tricep Pull Overs",
            "primary"=> "Triceps,Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lats",
            "tags"=> "Dumbbells,Bench,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2392-bench-dumbbell-tricep-pull-overs-how-to-do-exercise"
        },
        614=> {
            "name"=> "Alternating Bench Dumbbell Fly",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Elbow Flexors",
            "tags"=> "Bench,Strength",
            "url"=> "https://www.skimble.com/exercises/2391-alternating-bench-dumbbell-fly-how-to-do-exercise"
        },
        615=> {
            "name"=> "Basic Yogic Breath",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1898-basic-yogic-breath-how-to-do-exercise"
        },
        616=> {
            "name"=> "Body Bumps",
            "primary"=> "Upper Chest,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1170-body-bumps-how-to-do-exercise"
        },
        617=> {
            "name"=> "Clean and Jerk",
            "primary"=> "Rear Shoulders,Triceps,Upper Chest",
            "secondary"=> "Side Shoulders,Lower Back",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/4440-clean-and-jerk-how-to-do-exercise"
        },
        618=> {
            "name"=> "Double Medicine Ball Push-Ups",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Lats,Pec Minor,Back Extensors",
            "secondary"=> "Front Shoulders,Triceps,Biceps,Transverse Abdominis",
            "tags"=> "Medicine Ball,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/2031-double-medicine-ball-push-ups-how-to-do-exercise"
        },
        619=> {
            "name"=> "Elevated Chest Dips",
            "primary"=> "Upper Chest,Middle Chest,Pec Minor",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "tags"=> "Dip Bar,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/2343-elevated-chest-dips-how-to-do-exercise"
        },
        620=> {
            "name"=> "Dumbbell Bench Press",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Front Shoulders",
            "tags"=> "Dumbbells,Bench,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/2241-dumbbell-bench-press-how-to-do-exercise"
        },
        621=> {
            "name"=> "Dumbbell Rear Lateral Raises",
            "primary"=> "Upper Chest,Traps,Rhomboids",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Biceps",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1155-dumbbell-rear-lateral-raises-how-to-do-exercise"
        },
        622=> {
            "name"=> "Hamstring and Shoulder Stretches",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "tags"=> "No Equipment,Warmup,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/945-hamstring-and-shoulder-stretches-how-to-do-exercise"
        },
        623=> {
            "name"=> "Fish Pose",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Rear Shoulders,Upper Chest,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/436-fish-pose-how-to-do-exercise"
        },
        624=> {
            "name"=> "Kneeling Diamond Push-Ups",
            "primary"=> "Triceps,Upper Chest",
            "secondary"=> "Front Shoulders,Transverse Abdominis,Lats,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1044-kneeling-diamond-push-ups-how-to-do-exercise"
        },
        625=> {
            "name"=> "Incline Dumbbell Bench Press",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "tags"=> "Dumbbells,Bench,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/2342-incline-dumbbell-bench-press-how-to-do-exercise"
        },
        626=> {
            "name"=> "Fast Push-Ups",
            "primary"=> "Triceps,Upper Chest",
            "secondary"=> "Side Shoulders,Front Shoulders",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1652-fast-push-ups-how-to-do-exercise"
        },
        627=> {
            "name"=> "Front Back Jacks",
            "primary"=> "Upper Chest,Middle Chest,Quads",
            "secondary"=> "Side Shoulders,Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2007-front-back-jacks-how-to-do-exercise"
        },
        628=> {
            "name"=> "Elbow Plank with Knee Taps",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Triceps,Quads",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1035-elbow-plank-with-knee-taps-how-to-do-exercise"
        },
        629=> {
            "name"=> "Dumbbell Fly on Ball",
            "primary"=> "Upper Chest,Middle Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lower Chest,Glute Max,Quads,Rhomboids",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2239-dumbbell-fly-on-ball-how-to-do-exercise"
        },
        630=> {
            "name"=> "Good Morning Sunshines",
            "primary"=> "Upper Chest",
            "secondary"=> "Side Shoulders,Middle Chest",
            "tags"=> "No Equipment,Warmup,Crossfit,Stretching",
            "url"=> "https://www.skimble.com/exercises/1083-good-morning-sunshines-how-to-do-exercise"
        },
        631=> {
            "name"=> "Elbows-Out Chest Stretches",
            "primary"=> "Rear Shoulders,Upper Chest,Middle Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Lower Chest",
            "tags"=> "No Equipment,Warmup,Stretching",
            "url"=> "https://www.skimble.com/exercises/1055-elbows-out-chest-stretches-how-to-do-exercise"
        },
        632=> {
            "name"=> "High Knee Obliques",
            "primary"=> "Upper Chest,Left Obliques,Right Obliques,Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2140-high-knee-obliques-how-to-do-exercise"
        },
        633=> {
            "name"=> "Kettlebell Stability Shoulder Press",
            "primary"=> "Rear Shoulders,Triceps,Upper Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Lower Back",
            "tags"=> "Kettlebells,Barbells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5367-kettlebell-stability-shoulder-press-how-to-do-exercise"
        },
        634=> {
            "name"=> "Lion's Breath",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1608-lions-breath-how-to-do-exercise"
        },
        635=> {
            "name"=> "Left Dancer's Pose",
            "primary"=> "Side Shoulders,Upper Chest,Quads,Hamstrings",
            "secondary"=> "Lats,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1948-left-dancers-pose-how-to-do-exercise"
        },
        636=> {
            "name"=> "Overhead Reaches",
            "primary"=> "Upper Chest,Traps,Lats",
            "secondary"=> "Supinator",
            "tags"=> "Chair,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1053-overhead-reaches-how-to-do-exercise"
        },
        637=> {
            "name"=> "Pec Muscle Rolls",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/2451-pec-muscle-rolls-how-to-do-exercise"
        },
        638=> {
            "name"=> "Left High Lunge with Clasped Hands",
            "primary"=> "Upper Chest,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1918-left-high-lunge-with-clasped-hands-how-to-do-exercise"
        },
        639=> {
            "name"=> "Medicine Ball Chest Pass",
            "primary"=> "Supinator,Upper Chest,Middle Chest,Lower Chest,Pec Minor,Pronators",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Lats,Quads,Elbow Flexors",
            "tags"=> "Medicine Ball,Home Equipment,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2032-medicine-ball-chest-pass-how-to-do-exercise"
        },
        640=> {
            "name"=> "Pullovers on Ball",
            "primary"=> "Triceps,Upper Chest,Lats,Rhomboids",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1306-pullovers-on-ball-how-to-do-exercise"
        },
        641=> {
            "name"=> "Left Low Lunge Sidebend",
            "primary"=> "Upper Chest,Neck Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1906-left-low-lunge-sidebend-how-to-do-exercise"
        },
        642=> {
            "name"=> "Overhead Press",
            "primary"=> "Rear Shoulders,Triceps,Upper Chest",
            "secondary"=> "Lower Back",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5848-overhead-press-how-to-do-exercise"
        },
        643=> {
            "name"=> "Push-Ups on Bench",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps",
            "tags"=> "Bench,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2390-push-ups-on-bench-how-to-do-exercise"
        },
        644=> {
            "name"=> "Push-Ups with Feet on Bench",
            "primary"=> "Triceps,Upper Chest",
            "secondary"=> "Front Shoulders,Biceps,Middle Chest,Lower Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Back Extensors",
            "tags"=> "Bench,Bodyweight,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2362-push-ups-with-feet-on-bench-how-to-do-exercise"
        },
        645=> {
            "name"=> "Ring I Y T",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Rhomboids",
            "tags"=> "Rings,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5370-ring-i-y-t-how-to-do-exercise"
        },
        646=> {
            "name"=> "Split Stance Barbell Chest Press",
            "primary"=> "Rear Shoulders,Triceps,Upper Chest",
            "secondary"=> "Side Shoulders,Lower Back",
            "tags"=> "Barbells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1704-split-stance-barbell-chest-press-how-to-do-exercise"
        },
        647=> {
            "name"=> "Shorty Push-Ups",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Triceps",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1006-shorty-push-ups-how-to-do-exercise"
        },
        648=> {
            "name"=> "Ring Archer Push-Ups",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Upper Abs,Lower Abs",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Glute Max,Back Extensors",
            "tags"=> "Rings,Home Equipment,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5375-ring-archer-push-ups-how-to-do-exercise"
        },
        649=> {
            "name"=> "Right High Lunge with Clasped Hands",
            "primary"=> "Upper Chest,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1917-right-high-lunge-with-clasped-hands-how-to-do-exercise"
        },
        650=> {
            "name"=> "Ring Reverse T Flyes",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Rhomboids",
            "tags"=> "Rings,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5369-ring-reverse-t-flyes-how-to-do-exercise"
        },
        651=> {
            "name"=> "Ring Flyes",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Rhomboids",
            "tags"=> "Rings,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5368-ring-flyes-how-to-do-exercise"
        },
        652=> {
            "name"=> "Sphinx Pose",
            "primary"=> "Upper Chest",
            "secondary"=> "Side Shoulders,Upper Abs,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1137-sphinx-pose-how-to-do-exercise"
        },
        653=> {
            "name"=> "Seated Side Stretches",
            "primary"=> "Side Shoulders,Upper Chest,Lats",
            "secondary"=> "Traps",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/952-seated-side-stretches-how-to-do-exercise"
        },
        654=> {
            "name"=> "Split Stance Barbell Shoulder Press",
            "primary"=> "Rear Shoulders,Triceps,Upper Chest",
            "secondary"=> "Side Shoulders,Lower Back",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1166-split-stance-barbell-shoulder-press-how-to-do-exercise"
        },
        655=> {
            "name"=> "Stability Ball Chest Press",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Pec Minor",
            "secondary"=> "Glute Max",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1402-stability-ball-chest-press-how-to-do-exercise"
        },
        656=> {
            "name"=> "Standing Bow Pose",
            "primary"=> "Side Shoulders,Upper Chest,Quads,Hamstrings",
            "secondary"=> "Lats,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2252-standing-bow-pose-how-to-do-exercise"
        },
        657=> {
            "name"=> "Stability Ball Dumbbell Flys",
            "primary"=> "Side Shoulders,Rear Shoulders,Upper Chest",
            "secondary"=> "Rhomboids",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1406-stability-ball-dumbbell-flys-how-to-do-exercise"
        },
        658=> {
            "name"=> "Standing Crescent Moon Pose",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/941-standing-crescent-moon-pose-how-to-do-exercise"
        },
        659=> {
            "name"=> "Stability Ball Incline Press",
            "primary"=> "Upper Chest,Middle Chest",
            "secondary"=> "Front Shoulders,Triceps,Biceps,Quads",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1403-stability-ball-incline-press-how-to-do-exercise"
        },
        660=> {
            "name"=> "Standing Backbending Stretch",
            "primary"=> "Upper Chest,Middle Chest,Lower Chest,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/764-standing-backbending-stretch-how-to-do-exercise"
        },
        661=> {
            "name"=> "Star Jumps",
            "primary"=> "Side Shoulders,Upper Chest,Middle Chest,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1143-star-jumps-how-to-do-exercise"
        },
        662=> {
            "name"=> "Ab Ball Raises",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Lower Back",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1296-ab-ball-raises-how-to-do-exercise"
        },
        663=> {
            "name"=> "O Balance",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Glute Max,Hip Flexors,Adductors,Lower Back,Abductors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1355-o-balance-how-to-do-exercise"
        },
        664=> {
            "name"=> "90-90 Crunch Taps",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1243-90-90-crunch-taps-how-to-do-exercise"
        },
        665=> {
            "name"=> "Ab Chop Ups",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1257-ab-chop-ups-how-to-do-exercise"
        },
        666=> {
            "name"=> "Ab Curls",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Lower Back,Back Extensors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1358-ab-curls-how-to-do-exercise"
        },
        667=> {
            "name"=> "Ab Choppers",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Triceps",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1248-ab-choppers-how-to-do-exercise"
        },
        668=> {
            "name"=> "90-90 Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Upper Abs,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1138-90-90-crunches-how-to-do-exercise"
        },
        669=> {
            "name"=> "Ball Knee Balance",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Lower Back,Knee Flexors",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Home Equipment,Balance,",
            "url"=> "https://www.skimble.com/exercises/2379-ball-knee-balance-how-to-do-exercise"
        },
        670=> {
            "name"=> "Ball Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1290-ball-crunches-how-to-do-exercise"
        },
        671=> {
            "name"=> "Ball Ab Rolls",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Left Obliques",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1305-ball-ab-rolls-how-to-do-exercise"
        },
        672=> {
            "name"=> "Ball Extended Plank Pikes",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders",
            "tags"=> "Stability Ball,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/2377-ball-extended-plank-pikes-how-to-do-exercise"
        },
        673=> {
            "name"=> "Ball Leg Lifts",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Right Obliques,Neck Flexors",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1164-ball-leg-lifts-how-to-do-exercise"
        },
        674=> {
            "name"=> "Ball Foot to Hand Pass",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors",
            "secondary"=> "Adductors",
            "tags"=> "Stability Ball,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/24-ball-foot-to-hand-pass-how-to-do-exercise"
        },
        675=> {
            "name"=> "Ball Plank Pikes",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1300-ball-plank-pikes-how-to-do-exercise"
        },
        676=> {
            "name"=> "Ball Mountain Climbers",
            "primary"=> "Upper Abs,Lower Abs,Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Hip Flexors,Lower Back",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1569-ball-mountain-climbers-how-to-do-exercise"
        },
        677=> {
            "name"=> "Ball Pullover with Side Rotation",
            "primary"=> "Triceps,Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: Stability Ball,Medicine Ball",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1561-ball-pullover-with-side-rotation-how-to-do-exercise"
        },
        678=> {
            "name"=> "Bent Knee Twists",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1686-bent-knee-twists-how-to-do-exercise"
        },
        679=> {
            "name"=> "Bicycle in Bridge",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Hip Flexors,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Rear Shoulders,Traps,Lats,Quads,Calves,Rhomboids,Plantar Flexors,Teres Major",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1664-bicycle-in-bridge-how-to-do-exercise"
        },
        680=> {
            "name"=> "Boat Pose",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Hip Flexors",
            "tags"=> "Exercise Mat,No Equipment,Yoga,Pilates",
            "url"=> "https://www.skimble.com/exercises/544-boat-pose-how-to-do-exercise"
        },
        681=> {
            "name"=> "BOSU Hopouts",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Front Shoulders",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1261-bosu-hopouts-how-to-do-exercise"
        },
        682=> {
            "name"=> "Bird Dog",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/784-bird-dog-how-to-do-exercise"
        },
        683=> {
            "name"=> "BOSU Mountain Climbers",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Middle Chest,Glute Max,Quads,Rhomboids",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1183-bosu-mountain-climbers-how-to-do-exercise"
        },
        684=> {
            "name"=> "Buddy Back Stretches",
            "primary"=> "Upper Abs,Lower Abs,Lower Back,Back Extensors",
            "secondary"=> "Categories: Stretching,Partner",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/2123-buddy-back-stretches-how-to-do-exercise"
        },
        685=> {
            "name"=> "BOSU Side Plank",
            "primary"=> "Side Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Rear Shoulders",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/2035-bosu-side-plank-how-to-do-exercise"
        },
        686=> {
            "name"=> "Cat Cow",
            "primary"=> "Rear Shoulders,Upper Abs,Transverse Abdominis,Traps,Lats,Lower Back",
            "secondary"=> "Required Equipment: Exercise Mat,No Equipment",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/243-cat-cow-how-to-do-exercise"
        },
        687=> {
            "name"=> "Buttertoe Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Biceps,Transverse Abdominis",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1999-buttertoe-crunches-how-to-do-exercise"
        },
        688=> {
            "name"=> "Circular Crunches",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Transverse Abdominis,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1038-circular-crunches-how-to-do-exercise"
        },
        689=> {
            "name"=> "Churn the Pot on Ball",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Chest,Middle Chest,Glute Max",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1570-churn-the-pot-on-ball-how-to-do-exercise"
        },
        690=> {
            "name"=> "Basic Move",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1346-basic-move-how-to-do-exercise"
        },
        691=> {
            "name"=> "Cross Body Crunches",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/880-cross-body-crunches-how-to-do-exercise"
        },
        692=> {
            "name"=> "Cross Legged Sit-Ups",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1883-cross-legged-sit-ups-how-to-do-exercise"
        },
        693=> {
            "name"=> "Crunchy Frogs",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/825-crunchy-frogs-how-to-do-exercise"
        },
        694=> {
            "name"=> "Diamond Crunches",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Transverse Abdominis,Adductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/995-diamond-crunches-how-to-do-exercise"
        },
        695=> {
            "name"=> "Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/816-crunches-how-to-do-exercise"
        },
        696=> {
            "name"=> "Crunches with Knee Hugs",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2445-crunches-with-knee-hugs-how-to-do-exercise"
        },
        697=> {
            "name"=> "Cross Knees to Elbows",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/900-cross-knees-to-elbows-how-to-do-exercise"
        },
        698=> {
            "name"=> "Double Crunches",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/16-double-crunches-how-to-do-exercise"
        },
        699=> {
            "name"=> "Elbow Plank Hop Outs",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Adductors,Abductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1723-elbow-plank-hop-outs-how-to-do-exercise"
        },
        700=> {
            "name"=> "Elbow Plank on BOSU",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Rhomboids",
            "tags"=> "BOSU,Bodyweight,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1179-elbow-plank-on-bosu-how-to-do-exercise"
        },
        701=> {
            "name"=> "Elbow Plank on Ball",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Middle Chest",
            "tags"=> "Stability Ball,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1295-elbow-plank-on-ball-how-to-do-exercise"
        },
        702=> {
            "name"=> "Elbow Plank",
            "primary"=> "Upper Abs,Lower Abs,Lats",
            "secondary"=> "Transverse Abdominis,Quads",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/789-elbow-plank-how-to-do-exercise"
        },
        703=> {
            "name"=> "Elbow to Knee",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1840-elbow-to-knee-how-to-do-exercise"
        },
        704=> {
            "name"=> "Elbow Plank with Leg Lifts",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/838-elbow-plank-with-leg-lifts-how-to-do-exercise"
        },
        705=> {
            "name"=> "Elbow to Knee Bird Dogs",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Glute Max",
            "tags"=> "No Equipment,Warmup,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1033-elbow-to-knee-bird-dogs-how-to-do-exercise"
        },
        706=> {
            "name"=> "Flutter Kicks",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/902-flutter-kicks-how-to-do-exercise"
        },
        707=> {
            "name"=> "Fighting Surfer",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1791-fighting-surfer-how-to-do-exercise"
        },
        708=> {
            "name"=> "Fast Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1558-fast-crunches-how-to-do-exercise"
        },
        709=> {
            "name"=> "Full Ab Curls",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1591-full-ab-curls-how-to-do-exercise"
        },
        710=> {
            "name"=> "Frog Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Left Obliques,Right Obliques,Adductors,Abductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1684-frog-crunches-how-to-do-exercise"
        },
        711=> {
            "name"=> "Hanging Knee Raises",
            "primary"=> "Upper Abs,Lower Abs,Glute Max,Hip Flexors",
            "secondary"=> "Required Equipment: Pull Up Bar",
            "tags"=> "Home Equipment,Crossfit,Gym Equipment,",
            "url"=> "https://www.skimble.com/exercises/1951-hanging-knee-raises-how-to-do-exercise"
        },
        712=> {
            "name"=> "Half Side Planks",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Wrist Flexors,Glute Max,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/503-half-side-planks-how-to-do-exercise"
        },
        713=> {
            "name"=> "Hamstring Sit-Up Rolls",
            "primary"=> "Upper Abs,Lower Abs,Hamstrings",
            "secondary"=> "Hip Flexors,Adductors,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/910-hamstring-sit-up-rolls-how-to-do-exercise"
        },
        714=> {
            "name"=> "Hanging Pike",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors",
            "secondary"=> "Lats",
            "tags"=> "Pull Up Bar,Home Equipment,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/2282-hanging-pike-how-to-do-exercise"
        },
        715=> {
            "name"=> "Hollow Body Holds",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1011-hollow-body-holds-how-to-do-exercise"
        },
        716=> {
            "name"=> "Knee Hugs",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1756-knee-hugs-how-to-do-exercise"
        },
        717=> {
            "name"=> "In and Outs",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/821-in-and-outs-how-to-do-exercise"
        },
        718=> {
            "name"=> "Knee ups on Ball",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors",
            "secondary"=> "Quads",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1600-knee-ups-on-ball-how-to-do-exercise"
        },
        719=> {
            "name"=> "L Chin-Ups",
            "primary"=> "Upper Abs,Lower Abs,Lats,Neck Flexors",
            "secondary"=> "Biceps",
            "tags"=> "Pull Up Bar,Home Equipment,Crossfit,Rock Climbing,Strength",
            "url"=> "https://www.skimble.com/exercises/797-l-chin-ups-how-to-do-exercise"
        },
        720=> {
            "name"=> "Kneeling Plank",
            "primary"=> "Upper Abs,Lower Abs,Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Transverse Abdominis,Quads",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1683-kneeling-plank-how-to-do-exercise"
        },
        721=> {
            "name"=> "Kettlebell Figure Eights",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Front Shoulders",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1363-kettlebell-figure-eights-how-to-do-exercise"
        },
        722=> {
            "name"=> "Left Leg Hip Lift with Band",
            "primary"=> "Upper Abs,Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2348-left-leg-hip-lift-with-band-how-to-do-exercise"
        },
        723=> {
            "name"=> "Left Leg Climbs",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/834-left-leg-climbs-how-to-do-exercise"
        },
        724=> {
            "name"=> "Left Half Side Plank",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Supinator,Glute Max,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/933-left-half-side-plank-how-to-do-exercise"
        },
        725=> {
            "name"=> "Left Revolved Side Angle",
            "primary"=> "Upper Abs,Left Obliques,Right Obliques,Glute Max",
            "secondary"=> "Rhomboids",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1930-left-revolved-side-angle-how-to-do-exercise"
        },
        726=> {
            "name"=> "Left Revolved Half Moon",
            "primary"=> "Upper Abs,Glute Max,Hamstrings",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1928-left-revolved-half-moon-how-to-do-exercise"
        },
        727=> {
            "name"=> "Left Side Plank with Ball",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Glute Max,Lower Back",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1552-left-side-plank-with-ball-how-to-do-exercise"
        },
        728=> {
            "name"=> "Left Side Plank",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Glute Max,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/931-left-side-plank-how-to-do-exercise"
        },
        729=> {
            "name"=> "Left Side Plank Crunches",
            "primary"=> "Upper Abs,Lower Abs,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2129-left-side-plank-crunches-how-to-do-exercise"
        },
        730=> {
            "name"=> "Left Side Leg Circles",
            "primary"=> "Upper Abs,Lower Abs,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1354-left-side-leg-circles-how-to-do-exercise"
        },
        731=> {
            "name"=> "Left Twisted Chair Pose",
            "primary"=> "Upper Abs,Quads",
            "secondary"=> "Left Obliques,Right Obliques,Glute Max,Rhomboids",
            "tags"=> "Exercise Mat,Yoga,Balance",
            "url"=> "https://www.skimble.com/exercises/2069-left-twisted-chair-pose-how-to-do-exercise"
        },
        732=> {
            "name"=> "Leg Pull-Ins on a Bench",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors,Hamstrings",
            "tags"=> "Bench,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2388-leg-pull-ins-on-a-bench-how-to-do-exercise"
        },
        733=> {
            "name"=> "Leg Pull Back",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Glute Max,Hip Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1755-leg-pull-back-how-to-do-exercise"
        },
        734=> {
            "name"=> "Leg Lifts",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: Exercise Mat,No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/325-leg-lifts-how-to-do-exercise"
        },
        735=> {
            "name"=> "Leg Raises",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Neck Flexors",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/469-leg-raises-how-to-do-exercise"
        },
        736=> {
            "name"=> "Long Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1833-long-crunches-how-to-do-exercise"
        },
        737=> {
            "name"=> "Lotus Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Left Obliques,Right Obliques,Adductors,Abductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1685-lotus-crunches-how-to-do-exercise"
        },
        738=> {
            "name"=> "Max Rep Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1287-max-rep-crunches-how-to-do-exercise"
        },
        739=> {
            "name"=> "Max Rep Push-Ups",
            "primary"=> "Upper Abs,Transverse Abdominis",
            "secondary"=> "Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1286-max-rep-push-ups-how-to-do-exercise"
        },
        740=> {
            "name"=> "Medicine Ball Jackknife",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Triceps,Hip Flexors,Rhomboids",
            "tags"=> "Medicine Ball,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/79-medicine-ball-jackknife-how-to-do-exercise"
        },
        741=> {
            "name"=> "Lying Leg Figure Eights",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Hip Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1808-lying-leg-figure-eights-how-to-do-exercise"
        },
        742=> {
            "name"=> "Open Leg Rocker",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors",
            "secondary"=> "Lower Back",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1835-open-leg-rocker-how-to-do-exercise"
        },
        743=> {
            "name"=> "Partner Leg Lifts",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors",
            "secondary"=> "Triceps,Middle Chest,Transverse Abdominis,Quads",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/1599-partner-leg-lifts-how-to-do-exercise"
        },
        744=> {
            "name"=> "Overhead Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/934-overhead-crunches-how-to-do-exercise"
        },
        745=> {
            "name"=> "Partner Sit-ups",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/1598-partner-sit-ups-how-to-do-exercise"
        },
        746=> {
            "name"=> "Pilates Right Leg Climbs",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Front Shoulders,Left Obliques,Right Obliques,Hip Flexors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1838-pilates-right-leg-climbs-how-to-do-exercise"
        },
        747=> {
            "name"=> "Pilates Hip Circles",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Hip Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,Balance,",
            "url"=> "https://www.skimble.com/exercises/1759-pilates-hip-circles-how-to-do-exercise"
        },
        748=> {
            "name"=> "Pilates Scissors",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Left Obliques,Right Obliques,Hamstrings",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1754-pilates-scissors-how-to-do-exercise"
        },
        749=> {
            "name"=> "Plank on BOSU",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Rhomboids",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1180-plank-on-bosu-how-to-do-exercise"
        },
        750=> {
            "name"=> "Plank Bird Dog",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Lats,Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1130-plank-bird-dog-how-to-do-exercise"
        },
        751=> {
            "name"=> "Plank on BOSU Back",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Middle Chest,Lats,Rhomboids",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1262-plank-on-bosu-back-how-to-do-exercise"
        },
        752=> {
            "name"=> "Prone Rocker",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Upper Chest,Lats,Back Extensors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1357-prone-rocker-how-to-do-exercise"
        },
        753=> {
            "name"=> "Plank",
            "primary"=> "Upper Abs,Lower Abs,Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Transverse Abdominis,Quads",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/794-plank-how-to-do-exercise"
        },
        754=> {
            "name"=> "Pelvic Tilts",
            "primary"=> "Upper Abs,Lower Abs,Glute Max",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Warmup,Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1349-pelvic-tilts-how-to-do-exercise"
        },
        755=> {
            "name"=> "Pilates Left Leg Climbs",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Front Shoulders,Left Obliques,Right Obliques,Hip Flexors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1837-pilates-left-leg-climbs-how-to-do-exercise"
        },
        756=> {
            "name"=> "Pilates Rowing",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Lower Back",
            "secondary"=> "Front Shoulders,Rhomboids",
            "tags"=> "Exercise Mat,No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2202-pilates-rowing-how-to-do-exercise"
        },
        757=> {
            "name"=> "Pilates Around the World",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2137-pilates-around-the-world-how-to-do-exercise"
        },
        758=> {
            "name"=> "Plank on Ball",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Middle Chest",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1294-plank-on-ball-how-to-do-exercise"
        },
        759=> {
            "name"=> "Right Leg Climbs",
            "primary"=> "Upper Abs,Lower Abs,Right Obliques",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/833-right-leg-climbs-how-to-do-exercise"
        },
        760=> {
            "name"=> "Right Side Plank Crunches",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2128-right-side-plank-crunches-how-to-do-exercise"
        },
        761=> {
            "name"=> "Right Revolved Side Angle",
            "primary"=> "Upper Abs,Left Obliques,Right Obliques,Glute Max",
            "secondary"=> "Triceps,Biceps,Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1929-right-revolved-side-angle-how-to-do-exercise"
        },
        762=> {
            "name"=> "Right Side Plank with Ball",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Glute Max,Lower Back",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1548-right-side-plank-with-ball-how-to-do-exercise"
        },
        763=> {
            "name"=> "Right Side Leg Circles",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1353-right-side-leg-circles-how-to-do-exercise"
        },
        764=> {
            "name"=> "Ring Plank",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Triceps,Transverse Abdominis",
            "tags"=> "Rings,Crossfit,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5693-ring-plank-how-to-do-exercise"
        },
        765=> {
            "name"=> "Reverse Bicycles",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/824-reverse-bicycles-how-to-do-exercise"
        },
        766=> {
            "name"=> "Right Leg Hip Lift with Band",
            "primary"=> "Upper Abs,Lower Abs,Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2347-right-leg-hip-lift-with-band-how-to-do-exercise"
        },
        767=> {
            "name"=> "Roll Ups",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Hip Flexors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1752-roll-ups-how-to-do-exercise"
        },
        768=> {
            "name"=> "Right Half Side Plank",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Supinator,Glute Max,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/932-right-half-side-plank-how-to-do-exercise"
        },
        769=> {
            "name"=> "Right Revolved Half Moon",
            "primary"=> "Upper Abs,Left Obliques,Right Obliques,Glute Max,Hamstrings",
            "secondary"=> "Side Shoulders",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1927-right-revolved-half-moon-how-to-do-exercise"
        },
        770=> {
            "name"=> "Right Twisted Chair Pose",
            "primary"=> "Upper Abs,Left Obliques,Right Obliques,Glute Max,Quads",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Exercise Mat,Yoga,Balance",
            "url"=> "https://www.skimble.com/exercises/2070-right-twisted-chair-pose-how-to-do-exercise"
        },
        771=> {
            "name"=> "Right Side Plank",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Wrist Flexors,Glute Max,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/930-right-side-plank-how-to-do-exercise"
        },
        772=> {
            "name"=> "Roll Downs",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/962-roll-downs-how-to-do-exercise"
        },
        773=> {
            "name"=> "Rotating Leg Lifts",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1424-rotating-leg-lifts-how-to-do-exercise"
        },
        774=> {
            "name"=> "Seated Bicycle Crunches",
            "primary"=> "Upper Abs",
            "secondary"=> "Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1045-seated-bicycle-crunches-how-to-do-exercise"
        },
        775=> {
            "name"=> "Scissors in Bridge",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Glute Max,Hip Flexors,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Rear Shoulders,Traps,Lats,Quads,Calves,Rhomboids,Plantar Flexors,Teres Major",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1665-scissors-in-bridge-how-to-do-exercise"
        },
        776=> {
            "name"=> "Seated Knee Tucks",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Neck Flexors",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1050-seated-knee-tucks-how-to-do-exercise"
        },
        777=> {
            "name"=> "Short Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1831-short-crunches-how-to-do-exercise"
        },
        778=> {
            "name"=> "Sit-Ups",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/788-sit-ups-how-to-do-exercise"
        },
        779=> {
            "name"=> "Sliders",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/551-sliders-how-to-do-exercise"
        },
        780=> {
            "name"=> "Skull Shining",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1595-skull-shining-how-to-do-exercise"
        },
        781=> {
            "name"=> "Sit-Ups with Reach Ups",
            "primary"=> "Upper Abs,Lower Abs,Lats",
            "secondary"=> "Front Shoulders,Triceps",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1119-sit-ups-with-reach-ups-how-to-do-exercise"
        },
        782=> {
            "name"=> "Single Leg Floor Bridge on Ball",
            "primary"=> "Upper Abs,Lower Abs,Glute Max,Quads,Hamstrings",
            "secondary"=> "Left Obliques,Right Obliques,Lower Back",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1546-single-leg-floor-bridge-on-ball-how-to-do-exercise"
        },
        783=> {
            "name"=> "Seated Ball Toss with Partner",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps,Left Obliques,Right Obliques,Transverse Abdominis,Hip Flexors",
            "tags"=> "Medicine Ball,Home Equipment,Strength,Partner",
            "url"=> "https://www.skimble.com/exercises/1577-seated-ball-toss-with-partner-how-to-do-exercise"
        },
        784=> {
            "name"=> "Seated BOSU Balance",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "BOSU,Bodyweight,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1171-seated-bosu-balance-how-to-do-exercise"
        },
        785=> {
            "name"=> "Seated Leg Raises",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Lower Back",
            "tags"=> "Chair,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1650-seated-leg-raises-how-to-do-exercise"
        },
        786=> {
            "name"=> "Scissor Kicks",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/437-scissor-kicks-how-to-do-exercise"
        },
        787=> {
            "name"=> "Seated Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Neck Flexors",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1046-seated-crunches-how-to-do-exercise"
        },
        788=> {
            "name"=> "Sit Ups with Ball Zig Zags",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Medicine Ball,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1758-sit-ups-with-ball-zig-zags-how-to-do-exercise"
        },
        789=> {
            "name"=> "Seated Pelvic Tilts",
            "primary"=> "Upper Abs,Lower Abs,Lower Back",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Home Equipment,",
            "url"=> "https://www.skimble.com/exercises/2214-seated-pelvic-tilts-how-to-do-exercise"
        },
        790=> {
            "name"=> "Side Lunge with Twist",
            "primary"=> "Upper Abs,Lower Abs,Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/907-side-lunge-with-twist-how-to-do-exercise"
        },
        791=> {
            "name"=> "Spiderman Planks",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Triceps,Biceps,Hip Flexors,Quads",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1370-spiderman-planks-how-to-do-exercise"
        },
        792=> {
            "name"=> "Straight Back Rowing with Curl",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Biceps",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2115-straight-back-rowing-with-curl-how-to-do-exercise"
        },
        793=> {
            "name"=> "Toe Touch Single Arm",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/909-toe-touch-single-arm-how-to-do-exercise"
        },
        794=> {
            "name"=> "The Hundred",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Front Shoulders,Upper Chest,Middle Chest,Hip Flexors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1341-the-hundred-how-to-do-exercise"
        },
        795=> {
            "name"=> "U Crunches",
            "primary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Hip Flexors",
            "secondary"=> "Front Shoulders",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2417-u-crunches-how-to-do-exercise"
        },
        796=> {
            "name"=> "V-Sit with Foot Press",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors,Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/2121-v-sit-with-foot-press-how-to-do-exercise"
        },
        797=> {
            "name"=> "V-Sit Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/547-v-sit-crunches-how-to-do-exercise"
        },
        798=> {
            "name"=> "V-Ups",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/839-v-ups-how-to-do-exercise"
        },
        799=> {
            "name"=> "The Saw",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Side Shoulders",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1350-the-saw-how-to-do-exercise"
        },
        800=> {
            "name"=> "Toes to Bar",
            "primary"=> "Upper Abs,Lower Abs,Lats",
            "secondary"=> "Required Equipment: Pull Up Bar",
            "tags"=> "Bodyweight,Home Equipment,",
            "url"=> "https://www.skimble.com/exercises/848-toes-to-bar-how-to-do-exercise"
        },
        801=> {
            "name"=> "Spinal Roll",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Traps,Lats",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1395-spinal-roll-how-to-do-exercise"
        },
        802=> {
            "name"=> "Straight Leg Bicycle Abs",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/920-straight-leg-bicycle-abs-how-to-do-exercise"
        },
        803=> {
            "name"=> "Split Abs",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/813-split-abs-how-to-do-exercise"
        },
        804=> {
            "name"=> "Tree Climbs with Leg Extension",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Biceps,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2114-tree-climbs-with-leg-extension-how-to-do-exercise"
        },
        805=> {
            "name"=> "V-Ups and Roll-Ups",
            "primary"=> "Upper Abs,Lower Abs,Neck Flexors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/830-v-ups-and-roll-ups-how-to-do-exercise"
        },
        806=> {
            "name"=> "V-Sit Holds",
            "primary"=> "Upper Abs,Lower Abs,Hip Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Exercise Mat,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/37-v-sit-holds-how-to-do-exercise"
        },
        807=> {
            "name"=> "Vertical Leg Crunches with Dumbbells",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Front Shoulders,Upper Chest,Hip Flexors",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2400-vertical-leg-crunches-with-dumbbells-how-to-do-exercise"
        },
        808=> {
            "name"=> "Vertical Leg Crunches",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/814-vertical-leg-crunches-how-to-do-exercise"
        },
        809=> {
            "name"=> "Wide Leg Sit-Ups",
            "primary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/826-wide-leg-sit-ups-how-to-do-exercise"
        },
        810=> {
            "name"=> "Walking Inchworms with Push-Ups",
            "primary"=> "Triceps,Upper Abs,Lower Abs,Transverse Abdominis,Lower Back",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Wrist Flexors,Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1817-walking-inchworms-with-push-ups-how-to-do-exercise"
        },
        811=> {
            "name"=> "Yoga Bicycles",
            "primary"=> "Upper Abs,Left Obliques,Right Obliques,Neck Flexors",
            "secondary"=> "Lower Abs,Transverse Abdominis",
            "tags"=> "No Equipment,Yoga,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/416-yoga-bicycles-how-to-do-exercise"
        },
        812=> {
            "name"=> "Weighted Ball Crunch",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Left Obliques,Right Obliques,Transverse Abdominis,Glute Max",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/61-weighted-ball-crunch-how-to-do-exercise"
        },
        813=> {
            "name"=> "Bench Skull Crusher",
            "primary"=> "Triceps",
            "secondary"=> "Front Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Lats,Teres Major",
            "tags"=> "Dumbbells,Bench,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/2386-bench-skull-crusher-how-to-do-exercise"
        },
        814=> {
            "name"=> "Bench Dips",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Bench",
            "tags"=> "Home Equipment,Crossfit,Gym Equipment,",
            "url"=> "https://www.skimble.com/exercises/2276-bench-dips-how-to-do-exercise"
        },
        815=> {
            "name"=> "Cable Tricep Push Down",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2333-cable-tricep-push-down-how-to-do-exercise"
        },
        816=> {
            "name"=> "Bent Over Tricep Kickbacks",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2339-bent-over-tricep-kickbacks-how-to-do-exercise"
        },
        817=> {
            "name"=> "Chair Tricep Dips",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Quads",
            "tags"=> "Chair,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1079-chair-tricep-dips-how-to-do-exercise"
        },
        818=> {
            "name"=> "Cross Jacks",
            "primary"=> "Triceps,Lats,Glute Max,Quads",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1019-cross-jacks-how-to-do-exercise"
        },
        819=> {
            "name"=> "Dumbbell Right Leg Curl to Press",
            "primary"=> "Side Shoulders,Triceps,Quads",
            "secondary"=> "Biceps",
            "tags"=> "Dumbbells,Home Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/1213-dumbbell-right-leg-curl-to-press-how-to-do-exercise"
        },
        820=> {
            "name"=> "Half Cobra Pose",
            "primary"=> "Triceps,Lats,Lower Back",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1209-half-cobra-pose-how-to-do-exercise"
        },
        821=> {
            "name"=> "Dumbbell Upright Rows",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Front Shoulders,Biceps",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/958-dumbbell-upright-rows-how-to-do-exercise"
        },
        822=> {
            "name"=> "Dolphin Push-Ups",
            "primary"=> "Side Shoulders,Front Shoulders,Triceps,Middle Chest",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/840-dolphin-push-ups-how-to-do-exercise"
        },
        823=> {
            "name"=> "Dumbbell Left Leg Curl to Press",
            "primary"=> "Side Shoulders,Triceps,Quads",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Balance,Strength,",
            "url"=> "https://www.skimble.com/exercises/1214-dumbbell-left-leg-curl-to-press-how-to-do-exercise"
        },
        824=> {
            "name"=> "L Seat Lifts",
            "primary"=> "Triceps,Lower Abs,Hip Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Abs,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2151-l-seat-lifts-how-to-do-exercise"
        },
        825=> {
            "name"=> "Left High Lunge",
            "primary"=> "Side Shoulders,Triceps,Transverse Abdominis,Glute Max,Quads,Neck Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1896-left-high-lunge-how-to-do-exercise"
        },
        826=> {
            "name"=> "Left Tricep Stretch with Bind",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Supinator",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/944-left-tricep-stretch-with-bind-how-to-do-exercise"
        },
        827=> {
            "name"=> "Left Tricep Push-Ups",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/918-left-tricep-push-ups-how-to-do-exercise"
        },
        828=> {
            "name"=> "Left Dumbbell Woodchops",
            "primary"=> "Side Shoulders,Triceps,Quads",
            "secondary"=> "Front Shoulders,Rear Shoulders,Biceps,Upper Chest,Left Obliques,Right Obliques",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1235-left-dumbbell-woodchops-how-to-do-exercise"
        },
        829=> {
            "name"=> "Kneeling Left Tricep Kickbacks",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Dumbbells,Bench",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2457-kneeling-left-tricep-kickbacks-how-to-do-exercise"
        },
        830=> {
            "name"=> "High-Plank and Knee Draw",
            "primary"=> "Triceps,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Biceps",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/916-high-plank-and-knee-draw-how-to-do-exercise"
        },
        831=> {
            "name"=> "Lateral Lunge with Tricep Extension",
            "primary"=> "Triceps,Glute Max,Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Adductors,Abductors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2326-lateral-lunge-with-tricep-extension-how-to-do-exercise"
        },
        832=> {
            "name"=> "Left Arm Cross Stretch",
            "primary"=> "Rear Shoulders,Triceps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/864-left-arm-cross-stretch-how-to-do-exercise"
        },
        833=> {
            "name"=> "Kneeling Right Tricep Kickbacks",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Dumbbells,Bench",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2456-kneeling-right-tricep-kickbacks-how-to-do-exercise"
        },
        834=> {
            "name"=> "Left Tricep Stretch",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/946-left-tricep-stretch-how-to-do-exercise"
        },
        835=> {
            "name"=> "Plank with Shoulder Taps",
            "primary"=> "Side Shoulders,Triceps,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Rear Shoulders,Wrist Flexors,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1037-plank-with-shoulder-taps-how-to-do-exercise"
        },
        836=> {
            "name"=> "Prayer Hands Reaches",
            "primary"=> "Triceps,Traps",
            "secondary"=> "Supinator,Lats",
            "tags"=> "Chair,Warmup,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1123-prayer-hands-reaches-how-to-do-exercise"
        },
        837=> {
            "name"=> "Push-Up Knee Tucks",
            "primary"=> "Triceps,Middle Chest",
            "secondary"=> "Lower Abs,Lats",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/770-push-up-knee-tucks-how-to-do-exercise"
        },
        838=> {
            "name"=> "Overhead Tricep Extension with Band",
            "primary"=> "Triceps",
            "secondary"=> "Biceps",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2358-overhead-tricep-extension-with-band-how-to-do-exercise"
        },
        839=> {
            "name"=> "Plank with Toe Taps",
            "primary"=> "Triceps,Transverse Abdominis,Neck Flexors",
            "secondary"=> "Hip Flexors,Adductors,Quads,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1036-plank-with-toe-taps-how-to-do-exercise"
        },
        840=> {
            "name"=> "Modified Cobra",
            "primary"=> "Triceps,Traps,Rhomboids",
            "secondary"=> "Transverse Abdominis,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1850-modified-cobra-how-to-do-exercise"
        },
        841=> {
            "name"=> "Lying Dumbbell Tricep Extensions",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Dumbbells,Bench",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2459-lying-dumbbell-tricep-extensions-how-to-do-exercise"
        },
        842=> {
            "name"=> "Right Arm Cross Stretch",
            "primary"=> "Rear Shoulders,Triceps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/865-right-arm-cross-stretch-how-to-do-exercise"
        },
        843=> {
            "name"=> "Right Tricep Stretch with Bind",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Supinator",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/943-right-tricep-stretch-with-bind-how-to-do-exercise"
        },
        844=> {
            "name"=> "Push-Ups with Hands on Bench",
            "primary"=> "Triceps,Middle Chest,Lower Chest",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Bench,Bodyweight,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2361-push-ups-with-hands-on-bench-how-to-do-exercise"
        },
        845=> {
            "name"=> "Shoulder Stretches",
            "primary"=> "Rear Shoulders,Triceps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/963-shoulder-stretches-how-to-do-exercise"
        },
        846=> {
            "name"=> "Sit Throughs",
            "primary"=> "Triceps,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1423-sit-throughs-how-to-do-exercise"
        },
        847=> {
            "name"=> "Spiderman Walks",
            "primary"=> "Triceps,Transverse Abdominis,Hamstrings",
            "secondary"=> "Supinator,Wrist Flexors,Lats,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1139-spiderman-walks-how-to-do-exercise"
        },
        848=> {
            "name"=> "Ring Plank Knee Draw",
            "primary"=> "Triceps,Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Left Obliques,Glute Max,Hamstrings",
            "tags"=> "Rings,Crossfit,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5374-ring-plank-knee-draw-how-to-do-exercise"
        },
        849=> {
            "name"=> "Right Tricep Push-Ups",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/919-right-tricep-push-ups-how-to-do-exercise"
        },
        850=> {
            "name"=> "Right Tricep Stretch",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/947-right-tricep-stretch-how-to-do-exercise"
        },
        851=> {
            "name"=> "Right Dumbbell Woodchops",
            "primary"=> "Side Shoulders,Triceps,Quads",
            "secondary"=> "Front Shoulders,Rear Shoulders,Biceps,Upper Chest,Left Obliques,Right Obliques,Lats",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1217-right-dumbbell-woodchops-how-to-do-exercise"
        },
        852=> {
            "name"=> "Rope Tricep Push Down",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2334-rope-tricep-push-down-how-to-do-exercise"
        },
        853=> {
            "name"=> "Single Arm Tricep Push-Ups",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Rear Shoulders",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/980-single-arm-tricep-push-ups-how-to-do-exercise"
        },
        854=> {
            "name"=> "Tricep Push-Ups",
            "primary"=> "Triceps,Middle Chest",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/767-tricep-push-ups-how-to-do-exercise"
        },
        855=> {
            "name"=> "Tricep Dips",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Rear Shoulders,Wrist Flexors",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/809-tricep-dips-how-to-do-exercise"
        },
        856=> {
            "name"=> "Tricep Extensions",
            "primary"=> "Triceps",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/608-tricep-extensions-how-to-do-exercise"
        },
        857=> {
            "name"=> "Tricep Stretches",
            "primary"=> "Triceps",
            "secondary"=> "Lats",
            "tags"=> "No Equipment,Warmup,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1078-tricep-stretches-how-to-do-exercise"
        },
        858=> {
            "name"=> "Turbo Dog Variation",
            "primary"=> "Triceps,Lats",
            "secondary"=> "Categories: Cooldown,Yoga",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/3007-turbo-dog-variation-how-to-do-exercise"
        },
        859=> {
            "name"=> "Stability Ball Tricep Extension",
            "primary"=> "Triceps",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Lats,Glute Max",
            "tags"=> "Dumbbells,Stability Ball,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1405-stability-ball-tricep-extension-how-to-do-exercise"
        },
        860=> {
            "name"=> "Wall Tricep Extensions",
            "primary"=> "Triceps,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Biceps,Middle Chest",
            "tags"=> "Wall,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/913-wall-tricep-extensions-how-to-do-exercise"
        },
        861=> {
            "name"=> "Advanced Left Pyramid",
            "primary"=> "Rear Shoulders,Traps,Lats,Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2297-advanced-left-pyramid-how-to-do-exercise"
        },
        862=> {
            "name"=> "Chin to Chest Stretch",
            "primary"=> "Traps,Neck Extensors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/863-chin-to-chest-stretch-how-to-do-exercise"
        },
        863=> {
            "name"=> "Barbell Shrugs",
            "primary"=> "Traps,Levator Scapula",
            "secondary"=> "Required Equipment: Barbells",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2278-barbell-shrugs-how-to-do-exercise"
        },
        864=> {
            "name"=> "Barbell Power Cleans",
            "primary"=> "Side Shoulders,Traps,Glute Max,Quads,Hamstrings,Lower Back",
            "secondary"=> "Rear Shoulders,Biceps,Transverse Abdominis,Calves,Rhomboids,Back Extensors",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/114-barbell-power-cleans-how-to-do-exercise"
        },
        865=> {
            "name"=> "Counter-clockwise Neck Rolls",
            "primary"=> "Traps,Neck Flexors,Neck Extensors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/872-counter-clockwise-neck-rolls-how-to-do-exercise"
        },
        866=> {
            "name"=> "Clockwise Neck Rolls",
            "primary"=> "Traps,Neck Extensors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/727-clockwise-neck-rolls-how-to-do-exercise"
        },
        867=> {
            "name"=> "Curved Spine Stretch",
            "primary"=> "Traps,Lats",
            "secondary"=> "Side Shoulders,Rear Shoulders",
            "tags"=> "Chair,Warmup,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1099-curved-spine-stretch-how-to-do-exercise"
        },
        868=> {
            "name"=> "Dumbbell Shrugs",
            "primary"=> "Traps",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2337-dumbbell-shrugs-how-to-do-exercise"
        },
        869=> {
            "name"=> "Barbell Shrug Behind the Back",
            "primary"=> "Traps,Levator Scapula",
            "secondary"=> "Required Equipment: Barbells",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/2279-barbell-shrug-behind-the-back-how-to-do-exercise"
        },
        870=> {
            "name"=> "Back Rolls",
            "primary"=> "Traps,Lats,Lower Back,Back Extensors",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1588-back-rolls-how-to-do-exercise"
        },
        871=> {
            "name"=> "Barbell Reverse Grip Rows",
            "primary"=> "Traps,Lats,Lower Back,Rhomboids,Teres Major,Elbow Flexors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Biceps,Supinator,Wrist Flexors",
            "tags"=> "Barbells,Strength",
            "url"=> "https://www.skimble.com/exercises/1958-barbell-reverse-grip-rows-how-to-do-exercise"
        },
        872=> {
            "name"=> "Barbell Cleans",
            "primary"=> "Side Shoulders,Traps,Glute Max,Quads,Hamstrings,Lower Back",
            "secondary"=> "Rear Shoulders,Biceps,Transverse Abdominis,Calves,Rhomboids,Back Extensors",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5544-barbell-cleans-how-to-do-exercise"
        },
        873=> {
            "name"=> "Advanced Right Pyramid",
            "primary"=> "Rear Shoulders,Traps,Lats,Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2296-advanced-right-pyramid-how-to-do-exercise"
        },
        874=> {
            "name"=> "Cobra",
            "primary"=> "Traps,Lats",
            "secondary"=> "Middle Chest,Lower Chest,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1849-cobra-how-to-do-exercise"
        },
        875=> {
            "name"=> "Barbell Hang Cleans",
            "primary"=> "Side Shoulders,Rear Shoulders,Traps",
            "secondary"=> "Front Shoulders",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2054-barbell-hang-cleans-how-to-do-exercise"
        },
        876=> {
            "name"=> "Dumbell Back Row",
            "primary"=> "Rear Shoulders,Traps,Lats,Rhomboids",
            "secondary"=> "Biceps,Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/215-dumbell-back-row-how-to-do-exercise"
        },
        877=> {
            "name"=> "Left Lunge With Right Rows",
            "primary"=> "Traps,Lats,Quads,Rhomboids",
            "secondary"=> "Rear Shoulders,Hamstrings,Teres Major,Elbow Flexors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/642-left-lunge-with-right-rows-how-to-do-exercise"
        },
        878=> {
            "name"=> "Overhead Stretches",
            "primary"=> "Traps,Rhomboids",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1075-overhead-stretches-how-to-do-exercise"
        },
        879=> {
            "name"=> "Left Neck Stretch",
            "primary"=> "Traps",
            "secondary"=> "Adductors,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1714-left-neck-stretch-how-to-do-exercise"
        },
        880=> {
            "name"=> "Extended Child's Pose",
            "primary"=> "Side Shoulders,Rear Shoulders,Traps,Lats",
            "secondary"=> "Biceps",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/201-extended-childs-pose-how-to-do-exercise"
        },
        881=> {
            "name"=> "Easy Bridge Raises",
            "primary"=> "Rear Shoulders,Traps,Glute Max",
            "secondary"=> "Front Shoulders,Biceps",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/58863-easy-bridge-raises-how-to-do-exercise"
        },
        882=> {
            "name"=> "Full Locust Pose",
            "primary"=> "Side Shoulders,Rear Shoulders,Traps,Lats,Glute Max,Hamstrings,Rhomboids",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2262-full-locust-pose-how-to-do-exercise"
        },
        883=> {
            "name"=> "Lateral Neck Stretches",
            "primary"=> "Traps,Neck Extensors",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1062-lateral-neck-stretches-how-to-do-exercise"
        },
        884=> {
            "name"=> "Half-Way Lift",
            "primary"=> "Traps,Lats,Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1810-half-way-lift-how-to-do-exercise"
        },
        885=> {
            "name"=> "Inverted Rows",
            "primary"=> "Traps,Back Extensors",
            "secondary"=> "Triceps,Biceps",
            "tags"=> "Strength Machine,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2452-inverted-rows-how-to-do-exercise"
        },
        886=> {
            "name"=> "Left Lateral Neck Stretch",
            "primary"=> "Traps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/862-left-lateral-neck-stretch-how-to-do-exercise"
        },
        887=> {
            "name"=> "Neck Side Rotations",
            "primary"=> "Traps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1064-neck-side-rotations-how-to-do-exercise"
        },
        888=> {
            "name"=> "Right Lateral Neck Stretch",
            "primary"=> "Traps",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/861-right-lateral-neck-stretch-how-to-do-exercise"
        },
        889=> {
            "name"=> "Shoulder Rolls in Cobra",
            "primary"=> "Traps,Lats",
            "secondary"=> "Middle Chest,Lower Chest,Lower Back",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/3015-shoulder-rolls-in-cobra-how-to-do-exercise"
        },
        890=> {
            "name"=> "Twisting Chair Pose",
            "primary"=> "Side Shoulders,Left Obliques,Right Obliques,Traps,Lats,Glute Max,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1280-twisting-chair-pose-how-to-do-exercise"
        },
        891=> {
            "name"=> "Up and Down Neck Tilts",
            "primary"=> "Traps",
            "secondary"=> "Upper Chest,Lats",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1063-up-and-down-neck-tilts-how-to-do-exercise"
        },
        892=> {
            "name"=> "Seated Shoulder Stretch",
            "primary"=> "Traps,Neck Flexors",
            "secondary"=> "Triceps,Neck Extensors,Levator Scapula",
            "tags"=> "Yoga,Strength,",
            "url"=> "https://www.skimble.com/exercises/3013-seated-shoulder-stretch-how-to-do-exercise"
        },
        893=> {
            "name"=> "Right Lunge With Left Rows",
            "primary"=> "Rear Shoulders,Traps,Lats,Rhomboids",
            "secondary"=> "Biceps,Quads,Back Extensors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/193-right-lunge-with-left-rows-how-to-do-exercise"
        },
        894=> {
            "name"=> "Sage Pose",
            "primary"=> "Traps,Lats,Hamstrings",
            "secondary"=> "Glute Max,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1145-sage-pose-how-to-do-exercise"
        },
        895=> {
            "name"=> "Seated Cable Row",
            "primary"=> "Rear Shoulders,Traps,Lats,Rhomboids,Teres Major,Elbow Flexors,Back Extensors",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2332-seated-cable-row-how-to-do-exercise"
        },
        896=> {
            "name"=> "Ring Inverted Rows",
            "primary"=> "Traps,Back Extensors",
            "secondary"=> "Triceps,Biceps",
            "tags"=> "Rings,Bench,Crossfit,Rock Climbing,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5372-ring-inverted-rows-how-to-do-exercise"
        },
        897=> {
            "name"=> "Seated Side Stretch",
            "primary"=> "Rear Shoulders,Left Obliques,Right Obliques,Traps,Lats,Neck Flexors",
            "secondary"=> "Adductors",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1711-seated-side-stretch-how-to-do-exercise"
        },
        898=> {
            "name"=> "Spinal Flex",
            "primary"=> "Traps,Lats",
            "secondary"=> "Required Equipment: Exercise Mat,No Equipment",
            "tags"=> "Warmup,Cooldown,Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/113-spinal-flex-how-to-do-exercise"
        },
        899=> {
            "name"=> "Yoga Bridge",
            "primary"=> "Traps,Lats,Quads",
            "secondary"=> "Side Shoulders,Front Shoulders,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1796-yoga-bridge-how-to-do-exercise"
        },
        900=> {
            "name"=> "Dumbbell Renegade Rows",
            "primary"=> "Middle Chest,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Triceps,Left Obliques,Right Obliques",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1142-dumbbell-renegade-rows-how-to-do-exercise"
        },
        901=> {
            "name"=> "Dead Bug Holds",
            "primary"=> "Transverse Abdominis",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1888-dead-bug-holds-how-to-do-exercise"
        },
        902=> {
            "name"=> "Bridge with Leg Lifts on Ball",
            "primary"=> "Lower Abs,Transverse Abdominis",
            "secondary"=> "Left Obliques,Right Obliques,Neck Flexors",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1292-bridge-with-leg-lifts-on-ball-how-to-do-exercise"
        },
        903=> {
            "name"=> "C Curve Tucks",
            "primary"=> "Lower Abs,Transverse Abdominis",
            "secondary"=> "Upper Abs",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2000-c-curve-tucks-how-to-do-exercise"
        },
        904=> {
            "name"=> "Bridge on Ball",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis,Glute Max",
            "secondary"=> "Adductors,Quads",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1291-bridge-on-ball-how-to-do-exercise"
        },
        905=> {
            "name"=> "Full Scorpion Elbow Plank",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1691-full-scorpion-elbow-plank-how-to-do-exercise"
        },
        906=> {
            "name"=> "Hops with Squat Thrusts",
            "primary"=> "Transverse Abdominis,Glute Max,Quads",
            "secondary"=> "Upper Chest,Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1427-hops-with-squat-thrusts-how-to-do-exercise"
        },
        907=> {
            "name"=> "Kneeling Elbow Plank",
            "primary"=> "Transverse Abdominis",
            "secondary"=> "Front Shoulders,Upper Abs,Lower Abs,Lats",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1879-kneeling-elbow-plank-how-to-do-exercise"
        },
        908=> {
            "name"=> "Gate Openers",
            "primary"=> "Transverse Abdominis,Glute Max",
            "secondary"=> "Adductors,Quads",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1886-gate-openers-how-to-do-exercise"
        },
        909=> {
            "name"=> "Full Plank with Leg Lifts",
            "primary"=> "Lower Abs,Transverse Abdominis",
            "secondary"=> "Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/961-full-plank-with-leg-lifts-how-to-do-exercise"
        },
        910=> {
            "name"=> "Half Cross Extensions",
            "primary"=> "Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1878-half-cross-extensions-how-to-do-exercise"
        },
        911=> {
            "name"=> "Full Scorpion",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1789-full-scorpion-how-to-do-exercise"
        },
        912=> {
            "name"=> "Left Elbow to Opposite Knee Side Plank",
            "primary"=> "Right Obliques,Transverse Abdominis",
            "secondary"=> "Triceps,Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2021-left-elbow-to-opposite-knee-side-plank-how-to-do-exercise"
        },
        913=> {
            "name"=> "Mini Scorpion Elbow Plank",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1807-mini-scorpion-elbow-plank-how-to-do-exercise"
        },
        914=> {
            "name"=> "Left Oblique Crunches",
            "primary"=> "Left Obliques,Transverse Abdominis",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/259-left-oblique-crunches-how-to-do-exercise"
        },
        915=> {
            "name"=> "Mini Scorpion",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/1814-mini-scorpion-how-to-do-exercise"
        },
        916=> {
            "name"=> "Plank Heel Pushes",
            "primary"=> "Transverse Abdominis,Glute Max,Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2090-plank-heel-pushes-how-to-do-exercise"
        },
        917=> {
            "name"=> "Plank Hop Outs",
            "primary"=> "Lower Abs,Transverse Abdominis",
            "secondary"=> "Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1113-plank-hop-outs-how-to-do-exercise"
        },
        918=> {
            "name"=> "Push-Ups with Leg Lifts",
            "primary"=> "Transverse Abdominis,Glute Max",
            "secondary"=> "Triceps,Biceps,Lower Abs,Left Obliques,Right Obliques,Quads,Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1889-push-ups-with-leg-lifts-how-to-do-exercise"
        },
        919=> {
            "name"=> "Plank Lateral Walk",
            "primary"=> "Lower Abs,Transverse Abdominis,Glute Max",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1022-plank-lateral-walk-how-to-do-exercise"
        },
        920=> {
            "name"=> "Plank Hip Rotations",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis,Glute Max",
            "secondary"=> "Adductors,Quads,Hamstrings,Calves,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1884-plank-hip-rotations-how-to-do-exercise"
        },
        921=> {
            "name"=> "Renegade Rows with Push-Up",
            "primary"=> "Middle Chest,Transverse Abdominis,Rhomboids",
            "secondary"=> "Front Shoulders,Triceps,Left Obliques,Right Obliques,Lats",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/526-renegade-rows-with-push-up-how-to-do-exercise"
        },
        922=> {
            "name"=> "Right Elbow to Opposite Knee Side Plank",
            "primary"=> "Left Obliques,Transverse Abdominis",
            "secondary"=> "Triceps,Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2022-right-elbow-to-opposite-knee-side-plank-how-to-do-exercise"
        },
        923=> {
            "name"=> "Right Side Plank Rainbows",
            "primary"=> "Transverse Abdominis,Glute Max,Abductors",
            "secondary"=> "Left Obliques,Adductors,Quads",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2109-right-side-plank-rainbows-how-to-do-exercise"
        },
        924=> {
            "name"=> "Single Arm Mountain Climbers",
            "primary"=> "Transverse Abdominis",
            "secondary"=> "Lower Chest,Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2130-single-arm-mountain-climbers-how-to-do-exercise"
        },
        925=> {
            "name"=> "Side Lunge Crunches",
            "primary"=> "Left Obliques,Right Obliques,Transverse Abdominis",
            "secondary"=> "Lower Abs,Glute Max,Hip Flexors,Quads,Hamstrings",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1885-side-lunge-crunches-how-to-do-exercise"
        },
        926=> {
            "name"=> "Superman Planks",
            "primary"=> "Transverse Abdominis",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1425-superman-planks-how-to-do-exercise"
        },
        927=> {
            "name"=> "Sprawl and Knee Tucks",
            "primary"=> "Transverse Abdominis",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1689-sprawl-and-knee-tucks-how-to-do-exercise"
        },
        928=> {
            "name"=> "Supermans",
            "primary"=> "Transverse Abdominis,Lower Back",
            "secondary"=> "Glute Max,Lower Back,Rhomboids",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/605-supermans-how-to-do-exercise"
        },
        929=> {
            "name"=> "Star Push-Ups",
            "primary"=> "Side Shoulders,Transverse Abdominis",
            "secondary"=> "Front Shoulders,Rear Shoulders,Triceps,Biceps,Supinator,Wrist Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1707-star-push-ups-how-to-do-exercise"
        },
        930=> {
            "name"=> "Chest Stretch",
            "primary"=> "Side Shoulders,Rear Shoulders",
            "secondary"=> "Front Shoulders",
            "tags"=> "Wall,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1016-chest-stretch-how-to-do-exercise"
        },
        931=> {
            "name"=> "Bent Arm Lateral Shoulder Raise",
            "primary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Strength,",
            "url"=> "https://www.skimble.com/exercises/2395-bent-arm-lateral-shoulder-raise-how-to-do-exercise"
        },
        932=> {
            "name"=> "Crosses",
            "primary"=> "Side Shoulders",
            "secondary"=> "Biceps,Upper Chest",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1268-crosses-how-to-do-exercise"
        },
        933=> {
            "name"=> "Dumbbell Lateral Shoulder Raises",
            "primary"=> "Side Shoulders",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/694-dumbbell-lateral-shoulder-raises-how-to-do-exercise"
        },
        934=> {
            "name"=> "Contralateral Limb Raises",
            "primary"=> "Side Shoulders,Rear Shoulders,Glute Max",
            "secondary"=> "Traps,Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/898-contralateral-limb-raises-how-to-do-exercise"
        },
        935=> {
            "name"=> "Dumbbell Push Press",
            "primary"=> "Side Shoulders",
            "secondary"=> "Triceps,Calves",
            "tags"=> "Dumbbells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/451-dumbbell-push-press-how-to-do-exercise"
        },
        936=> {
            "name"=> "Elbow To Knee Twists",
            "primary"=> "Side Shoulders,Left Obliques,Right Obliques",
            "secondary"=> "Upper Chest,Neck Flexors",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1109-elbow-to-knee-twists-how-to-do-exercise"
        },
        937=> {
            "name"=> "Handstand Push-Ups",
            "primary"=> "Side Shoulders,Lats",
            "secondary"=> "Triceps,Biceps",
            "tags"=> "Wall,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/817-handstand-push-ups-how-to-do-exercise"
        },
        938=> {
            "name"=> "Flying Supermans",
            "primary"=> "Side Shoulders,Rear Shoulders,Glute Max,Lower Back",
            "secondary"=> "Front Shoulders,Traps,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/942-flying-supermans-how-to-do-exercise"
        },
        939=> {
            "name"=> "Jumping Jacks",
            "primary"=> "Side Shoulders",
            "secondary"=> "Lats,Glute Max,Quads,Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/786-jumping-jacks-how-to-do-exercise"
        },
        940=> {
            "name"=> "Knee Raise to Right Warrior 3",
            "primary"=> "Side Shoulders,Lower Abs,Glute Max,Quads,Hamstrings",
            "secondary"=> "Lats,Calves,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1619-knee-raise-to-right-warrior-3-how-to-do-exercise"
        },
        941=> {
            "name"=> "Lateral Shoulder Raises with Band",
            "primary"=> "Side Shoulders",
            "secondary"=> "Front Shoulders,Rear Shoulders,Lower Back",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2138-lateral-shoulder-raises-with-band-how-to-do-exercise"
        },
        942=> {
            "name"=> "Knee Raise to Left Warrior 3",
            "primary"=> "Side Shoulders,Lower Abs,Quads,Hamstrings",
            "secondary"=> "Lats,Glute Max,Calves,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1613-knee-raise-to-left-warrior-3-how-to-do-exercise"
        },
        943=> {
            "name"=> "Left Ostrich",
            "primary"=> "Side Shoulders,Rear Shoulders,Glute Max,Hip Flexors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1910-left-ostrich-how-to-do-exercise"
        },
        944=> {
            "name"=> "Left Warrior 1",
            "primary"=> "Side Shoulders,Glute Max,Quads,Neck Flexors",
            "secondary"=> "Triceps,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1786-left-warrior-1-how-to-do-exercise"
        },
        945=> {
            "name"=> "Locust",
            "primary"=> "Side Shoulders,Rear Shoulders,Lats,Glute Max,Quads,Lower Back,Rhomboids,Back Extensors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1594-locust-how-to-do-exercise"
        },
        946=> {
            "name"=> "Lying Supermans",
            "primary"=> "Side Shoulders,Rear Shoulders,Glute Max,Lower Back",
            "secondary"=> "Front Shoulders,Traps,Rhomboids",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/812-lying-supermans-how-to-do-exercise"
        },
        947=> {
            "name"=> "Lunge with Side Tilt Rotations",
            "primary"=> "Side Shoulders,Lats,Glute Max,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1421-lunge-with-side-tilt-rotations-how-to-do-exercise"
        },
        948=> {
            "name"=> "Overhead Presses",
            "primary"=> "Side Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/689-overhead-presses-how-to-do-exercise"
        },
        949=> {
            "name"=> "Push Presses",
            "primary"=> "Side Shoulders",
            "secondary"=> "Quads,Calves",
            "tags"=> "Barbells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/835-push-presses-how-to-do-exercise"
        },
        950=> {
            "name"=> "Right High Lunge Sidebend",
            "primary"=> "Side Shoulders,Rear Shoulders,Glute Max,Quads",
            "secondary"=> "Left Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1907-right-high-lunge-sidebend-how-to-do-exercise"
        },
        951=> {
            "name"=> "Right High Lunge",
            "primary"=> "Side Shoulders,Glute Max,Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1383-right-high-lunge-how-to-do-exercise"
        },
        952=> {
            "name"=> "Right Lateral Kettlebell Swings",
            "primary"=> "Side Shoulders,Glute Max,Quads",
            "secondary"=> "Supinator,Wrist Flexors,Left Obliques,Right Obliques,Glute Max,Quads,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/1367-right-lateral-kettlebell-swings-how-to-do-exercise"
        },
        953=> {
            "name"=> "Right Low Lunge",
            "primary"=> "Side Shoulders,Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1385-right-low-lunge-how-to-do-exercise"
        },
        954=> {
            "name"=> "Right Warrior 1",
            "primary"=> "Side Shoulders,Glute Max,Quads,Neck Flexors",
            "secondary"=> "Triceps,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1785-right-warrior-1-how-to-do-exercise"
        },
        955=> {
            "name"=> "Sandbag Carry",
            "primary"=> "Side Shoulders,Rear Shoulders",
            "secondary"=> "Required Equipment: Sandbags",
            "tags"=> "Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/693-sandbag-carry-how-to-do-exercise"
        },
        956=> {
            "name"=> "Side Slides",
            "primary"=> "Side Shoulders,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Warmup,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1745-side-slides-how-to-do-exercise"
        },
        957=> {
            "name"=> "Standing Chest Stretch",
            "primary"=> "Side Shoulders,Rear Shoulders,Rhomboids",
            "secondary"=> "Upper Chest,Middle Chest,Lower Chest",
            "tags"=> "No Equipment,Warmup,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/2010-standing-chest-stretch-how-to-do-exercise"
        },
        958=> {
            "name"=> "Split Jerk",
            "primary"=> "Side Shoulders,Lats,Glute Max,Quads,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/796-split-jerk-how-to-do-exercise"
        },
        959=> {
            "name"=> "Wacky Jacks",
            "primary"=> "Side Shoulders",
            "secondary"=> "Left Obliques,Right Obliques,Lats,Quads",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/966-wacky-jacks-how-to-do-exercise"
        },
        960=> {
            "name"=> "Upward Salute",
            "primary"=> "Side Shoulders,Quads",
            "secondary"=> "Required Equipment: Exercise Mat,No Equipment",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/654-upward-salute-how-to-do-exercise"
        },
        961=> {
            "name"=> "Alternating Side Crunches",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1834-alternating-side-crunches-how-to-do-exercise"
        },
        962=> {
            "name"=> "Bharadvaja's Twist",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1945-bharadvajas-twist-how-to-do-exercise"
        },
        963=> {
            "name"=> "Ankle Grabbers",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1681-ankle-grabbers-how-to-do-exercise"
        },
        964=> {
            "name"=> "Cross Leg Obliques",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Hamstrings",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2159-cross-leg-obliques-how-to-do-exercise"
        },
        965=> {
            "name"=> "Cow Face Pose with Left Leg Straight",
            "primary"=> "Right Obliques,Hamstrings,Knee Flexors",
            "secondary"=> "Categories: Yoga,Stretching",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/3005-cow-face-pose-with-left-leg-straight-how-to-do-exercise"
        },
        966=> {
            "name"=> "Dumbbell Side Bends",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Lower Back",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/888-dumbbell-side-bends-how-to-do-exercise"
        },
        967=> {
            "name"=> "Dumbbell Left Side Bends",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1128-dumbbell-left-side-bends-how-to-do-exercise"
        },
        968=> {
            "name"=> "C Curve Obliques",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2001-c-curve-obliques-how-to-do-exercise"
        },
        969=> {
            "name"=> "Crunch Punches",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Biceps,Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1794-crunch-punches-how-to-do-exercise"
        },
        970=> {
            "name"=> "Dumbbell Right Side Bends",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1127-dumbbell-right-side-bends-how-to-do-exercise"
        },
        971=> {
            "name"=> "Front Rack Barbell Walk",
            "primary"=> "Left Obliques,Right Obliques,Lower Back",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Barbells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/5134-front-rack-barbell-walk-how-to-do-exercise"
        },
        972=> {
            "name"=> "Half Moon Pose with Hands to Feet Pose",
            "primary"=> "Side Shoulders,Left Obliques,Right Obliques,Lats,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2249-half-moon-pose-with-hands-to-feet-pose-how-to-do-exercise"
        },
        973=> {
            "name"=> "Hot Potato Squats",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Quads,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2238-hot-potato-squats-how-to-do-exercise"
        },
        974=> {
            "name"=> "Kimura Sit-Ups",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Front Shoulders,Upper Abs,Lower Abs",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1811-kimura-sit-ups-how-to-do-exercise"
        },
        975=> {
            "name"=> "Knees to Elbows",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/986-knees-to-elbows-how-to-do-exercise"
        },
        976=> {
            "name"=> "Left Downward Woodchop with Band",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2357-left-downward-woodchop-with-band-how-to-do-exercise"
        },
        977=> {
            "name"=> "Left Lunge Easy Twist",
            "primary"=> "Left Obliques,Right Obliques,Glute Max",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1847-left-lunge-easy-twist-how-to-do-exercise"
        },
        978=> {
            "name"=> "Left Oblique V-Ups",
            "primary"=> "Right Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/832-left-oblique-v-ups-how-to-do-exercise"
        },
        979=> {
            "name"=> "Left Mermaid Pose",
            "primary"=> "Left Obliques,Right Obliques,Lats",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1352-left-mermaid-pose-how-to-do-exercise"
        },
        980=> {
            "name"=> "Left Peaceful Warrior",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Hip Flexors,Quads",
            "secondary"=> "Side Shoulders,Adductors,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1845-left-peaceful-warrior-how-to-do-exercise"
        },
        981=> {
            "name"=> "Left Pike Side Twists",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Rear Shoulders,Transverse Abdominis",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2113-left-pike-side-twists-how-to-do-exercise"
        },
        982=> {
            "name"=> "Left Twisting High Lunge",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Quads",
            "secondary"=> "Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1839-left-twisting-high-lunge-how-to-do-exercise"
        },
        983=> {
            "name"=> "Lying Spinal Twist with Crossed Legs",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1923-lying-spinal-twist-with-crossed-legs-how-to-do-exercise"
        },
        984=> {
            "name"=> "Left Side Plank Dips",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Lats",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1117-left-side-plank-dips-how-to-do-exercise"
        },
        985=> {
            "name"=> "Left Reverse Crescent",
            "primary"=> "Left Obliques,Right Obliques,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1616-left-reverse-crescent-how-to-do-exercise"
        },
        986=> {
            "name"=> "Marichi's Twist",
            "primary"=> "Lower Abs,Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Glute Max,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1254-marichis-twist-how-to-do-exercise"
        },
        987=> {
            "name"=> "Modified Weighted Russian Twists",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Chest",
            "tags"=> "Dumbbells,Bodyweight,Strength",
            "url"=> "https://www.skimble.com/exercises/58993-modified-weighted-russian-twists-how-to-do-exercise"
        },
        988=> {
            "name"=> "Oblique Shoulder Rotation on Ball",
            "primary"=> "Left Obliques,Right Obliques,Glute Max",
            "secondary"=> "Side Shoulders,Front Shoulders,Lats",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1582-oblique-shoulder-rotation-on-ball-how-to-do-exercise"
        },
        989=> {
            "name"=> "Revolved Head to Knee",
            "primary"=> "Left Obliques,Right Obliques,Lats",
            "secondary"=> "Side Shoulders,Adductors,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1271-revolved-head-to-knee-how-to-do-exercise"
        },
        990=> {
            "name"=> "Oblique V-Sits",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1118-oblique-v-sits-how-to-do-exercise"
        },
        991=> {
            "name"=> "Oblique Crunches",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2236-oblique-crunches-how-to-do-exercise"
        },
        992=> {
            "name"=> "Partner Torso Twists with Ball",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Transverse Abdominis,Hip Flexors",
            "tags"=> "Medicine Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2208-partner-torso-twists-with-ball-how-to-do-exercise"
        },
        993=> {
            "name"=> "Right Mermaid Pose",
            "primary"=> "Left Obliques,Right Obliques,Lats",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1351-right-mermaid-pose-how-to-do-exercise"
        },
        994=> {
            "name"=> "Right Peaceful Warrior",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Quads,Neck Flexors",
            "secondary"=> "Side Shoulders,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1384-right-peaceful-warrior-how-to-do-exercise"
        },
        995=> {
            "name"=> "Right Side Crunches",
            "primary"=> "Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2440-right-side-crunches-how-to-do-exercise"
        },
        996=> {
            "name"=> "Right Side Plank Dips",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Lats",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1116-right-side-plank-dips-how-to-do-exercise"
        },
        997=> {
            "name"=> "Right Low Lunge Sidebend",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Hip Flexors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1905-right-low-lunge-sidebend-how-to-do-exercise"
        },
        998=> {
            "name"=> "Right Lunge Easy Twist",
            "primary"=> "Left Obliques,Right Obliques,Glute Max",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1846-right-lunge-easy-twist-how-to-do-exercise"
        },
        999=> {
            "name"=> "Right Reverse Crescent",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Quads",
            "secondary"=> "Side Shoulders,Front Shoulders,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1610-right-reverse-crescent-how-to-do-exercise"
        },
        1000=> {
            "name"=> "Right Oblique Crunches",
            "primary"=> "Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/782-right-oblique-crunches-how-to-do-exercise"
        },
        1001=> {
            "name"=> "Right Upward Woodchop with Band",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2354-right-upward-woodchop-with-band-how-to-do-exercise"
        },
        1002=> {
            "name"=> "Right Side Stretch",
            "primary"=> "Right Obliques,Lats",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/867-right-side-stretch-how-to-do-exercise"
        },
        1003=> {
            "name"=> "Side Plank Dips",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Lats",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/808-side-plank-dips-how-to-do-exercise"
        },
        1004=> {
            "name"=> "Seated Cross Body Crunches",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Chest,Upper Abs",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1066-seated-cross-body-crunches-how-to-do-exercise"
        },
        1005=> {
            "name"=> "Russian Twists",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/669-russian-twists-how-to-do-exercise"
        },
        1006=> {
            "name"=> "Right Twisting High Lunge",
            "primary"=> "Left Obliques,Right Obliques,Glute Max,Quads,Hamstrings",
            "secondary"=> "Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1386-right-twisting-high-lunge-how-to-do-exercise"
        },
        1007=> {
            "name"=> "Seated Moon Stretch",
            "primary"=> "Left Obliques,Right Obliques,Lats",
            "secondary"=> "Side Shoulders,Rear Shoulders,Adductors,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1803-seated-moon-stretch-how-to-do-exercise"
        },
        1008=> {
            "name"=> "Russian Twists with a Ball",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Chest",
            "tags"=> "Medicine Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1162-russian-twists-with-a-ball-how-to-do-exercise"
        },
        1009=> {
            "name"=> "Torso Rotations on Stability Ball",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1544-torso-rotations-on-stability-ball-how-to-do-exercise"
        },
        1010=> {
            "name"=> "Weighted Russian Twists on BOSU",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Chest",
            "tags"=> "Dumbbells,BOSU,Gym Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/1172-weighted-russian-twists-on-bosu-how-to-do-exercise"
        },
        1011=> {
            "name"=> "Torso Twists",
            "primary"=> "Left Obliques,Right Obliques,Lower Back",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/983-torso-twists-how-to-do-exercise"
        },
        1012=> {
            "name"=> "Sumo Obliques",
            "primary"=> "Left Obliques,Right Obliques,Quads",
            "secondary"=> "Glute Max",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1150-sumo-obliques-how-to-do-exercise"
        },
        1013=> {
            "name"=> "Torso Twist with Band",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Required Equipment: Resistance Bands",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/210-torso-twist-with-band-how-to-do-exercise"
        },
        1014=> {
            "name"=> "Weighted Russian Twists",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Front Shoulders",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/592-weighted-russian-twists-how-to-do-exercise"
        },
        1015=> {
            "name"=> "Dumbbell Bent Over Rows",
            "primary"=> "Rear Shoulders,Rhomboids",
            "secondary"=> "Biceps,Hamstrings,Lower Back",
            "tags"=> "Dumbbells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/256-dumbbell-bent-over-rows-how-to-do-exercise"
        },
        1016=> {
            "name"=> "Kettlebell Right Arm Bent Over Row",
            "primary"=> "Rear Shoulders,Lats,Rhomboids",
            "secondary"=> "Biceps,Supinator,Transverse Abdominis,Traps",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1710-kettlebell-right-arm-bent-over-row-how-to-do-exercise"
        },
        1017=> {
            "name"=> "Back Extension on Ball",
            "primary"=> "Lats,Rhomboids,Back Extensors",
            "secondary"=> "Left Obliques,Right Obliques,Traps,Glute Max",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1572-back-extension-on-ball-how-to-do-exercise"
        },
        1018=> {
            "name"=> "Kettlebell Left Arm Bent Over Row",
            "primary"=> "Rear Shoulders,Lats,Rhomboids",
            "secondary"=> "Biceps,Supinator,Transverse Abdominis,Traps",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1709-kettlebell-left-arm-bent-over-row-how-to-do-exercise"
        },
        1019=> {
            "name"=> "Double Kettlebell Bent Over Rows",
            "primary"=> "Rear Shoulders,Rhomboids",
            "secondary"=> "Biceps,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/5147-double-kettlebell-bent-over-rows-how-to-do-exercise"
        },
        1020=> {
            "name"=> "Rhomboid Rolls",
            "primary"=> "Rhomboids",
            "secondary"=> "",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/2447-rhomboid-rolls-how-to-do-exercise"
        },
        1021=> {
            "name"=> "The Swan",
            "primary"=> "Lower Back,Rhomboids,Back Extensors",
            "secondary"=> "Triceps,Biceps",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1348-the-swan-how-to-do-exercise"
        },
        1022=> {
            "name"=> "Prone Cobra",
            "primary"=> "Rhomboids,Back Extensors",
            "secondary"=> "Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/921-prone-cobra-how-to-do-exercise"
        },
        1023=> {
            "name"=> "Rhomboid Opener",
            "primary"=> "Lower Abs,Rhomboids",
            "secondary"=> "Front Shoulders,Traps,Lats",
            "tags"=> "Exercise Mat,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1147-rhomboid-opener-how-to-do-exercise"
        },
        1024=> {
            "name"=> "Supinated Grip Kettlebell Bent Over Rows",
            "primary"=> "Rear Shoulders,Rhomboids",
            "secondary"=> "Biceps,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/5148-supinated-grip-kettlebell-bent-over-rows-how-to-do-exercise"
        },
        1025=> {
            "name"=> "Upper Back Swimmer Stretches",
            "primary"=> "Lats,Rhomboids",
            "secondary"=> "Side Shoulders,Wrist Flexors,Upper Chest",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1071-upper-back-swimmer-stretches-how-to-do-exercise"
        },
        1026=> {
            "name"=> "Left Arm Lateral Drag",
            "primary"=> "Rear Shoulders,Lats",
            "secondary"=> "Required Equipment: Sandbags",
            "tags"=> "Home Equipment,Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/346-left-arm-lateral-drag-how-to-do-exercise"
        },
        1027=> {
            "name"=> "Left Lawnmower with Kettlebell",
            "primary"=> "Rear Shoulders,Glute Max,Quads",
            "secondary"=> "Triceps,Biceps,Traps,Lats,Hamstrings,Lower Back,Rhomboids",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1556-left-lawnmower-with-kettlebell-how-to-do-exercise"
        },
        1028=> {
            "name"=> "Left Lunge with Kettlebell Rows",
            "primary"=> "Rear Shoulders,Lats,Glute Max,Quads",
            "secondary"=> "Side Shoulders,Triceps,Biceps,Hamstrings,Lower Back,Rhomboids",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1554-left-lunge-with-kettlebell-rows-how-to-do-exercise"
        },
        1029=> {
            "name"=> "Rear Delt Squeeze with Band",
            "primary"=> "Rear Shoulders",
            "secondary"=> "Side Shoulders,Upper Chest",
            "tags"=> "Resistance Bands,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1719-rear-delt-squeeze-with-band-how-to-do-exercise"
        },
        1030=> {
            "name"=> "Right Arm Lateral Drag",
            "primary"=> "Rear Shoulders,Lats",
            "secondary"=> "Required Equipment: Sandbags",
            "tags"=> "Home Equipment,Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/407-right-arm-lateral-drag-how-to-do-exercise"
        },
        1031=> {
            "name"=> "3 Point Touches",
            "primary"=> "Quads",
            "secondary"=> "Hip Flexors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/2004-3-point-touches-how-to-do-exercise"
        },
        1032=> {
            "name"=> "Back Lunge Kick Jump Switch",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2144-back-lunge-kick-jump-switch-how-to-do-exercise"
        },
        1033=> {
            "name"=> "ARC Trainer",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Knee Flexors,Back Extensors",
            "tags"=> "Cardio Machine,Warmup,Cooldown,Home Equipment,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/44411-arc-trainer-how-to-do-exercise"
        },
        1034=> {
            "name"=> "Barbell Side Split Squat",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Barbells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2280-barbell-side-split-squat-how-to-do-exercise"
        },
        1035=> {
            "name"=> "Barbell Squats",
            "primary"=> "Quads,Lower Back",
            "secondary"=> "Glute Max",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1163-barbell-squats-how-to-do-exercise"
        },
        1036=> {
            "name"=> "Barbell Deadlifts",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Lats,Lower Back,Back Extensors",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/722-barbell-deadlifts-how-to-do-exercise"
        },
        1037=> {
            "name"=> "Barbell Front Loaded Squats",
            "primary"=> "Lats,Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1668-barbell-front-loaded-squats-how-to-do-exercise"
        },
        1038=> {
            "name"=> "Barbell Lunges",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Barbells",
            "tags"=> "Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1256-barbell-lunges-how-to-do-exercise"
        },
        1039=> {
            "name"=> "Ball Front Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Stability Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/613-ball-front-squats-how-to-do-exercise"
        },
        1040=> {
            "name"=> "Ball Walk Ups",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Lower Back",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/2216-ball-walk-ups-how-to-do-exercise"
        },
        1041=> {
            "name"=> "Alternating Suitcase Split Squats with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Left Obliques,Hamstrings",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2048-alternating-suitcase-split-squats-with-kettlebell-how-to-do-exercise"
        },
        1042=> {
            "name"=> "7 Point Touches",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Adductors,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/2005-7-point-touches-how-to-do-exercise"
        },
        1043=> {
            "name"=> "Barbell Step Ups",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Barbells,Bench,Gym Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/2277-barbell-step-ups-how-to-do-exercise"
        },
        1044=> {
            "name"=> "Beginner Right Warrior 2",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2298-beginner-right-warrior-2-how-to-do-exercise"
        },
        1045=> {
            "name"=> "Bike",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/1731-bike-how-to-do-exercise"
        },
        1046=> {
            "name"=> "Beginner Left Warrior 2",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2299-beginner-left-warrior-2-how-to-do-exercise"
        },
        1047=> {
            "name"=> "Bike Quickly",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Calves",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/64-bike-quickly-how-to-do-exercise"
        },
        1048=> {
            "name"=> "BOSU Drop Squats",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Adductors,Abductors",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/2038-bosu-drop-squats-how-to-do-exercise"
        },
        1049=> {
            "name"=> "BOSU Hopovers",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1208-bosu-hopovers-how-to-do-exercise"
        },
        1050=> {
            "name"=> "BOSU Right Offset Squats",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Hip Flexors,Hamstrings",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1176-bosu-right-offset-squats-how-to-do-exercise"
        },
        1051=> {
            "name"=> "BOSU Left Offset Squats",
            "primary"=> "Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Adductors,Abductors",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1177-bosu-left-offset-squats-how-to-do-exercise"
        },
        1052=> {
            "name"=> "Bow Pose",
            "primary"=> "Glute Max,Quads,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Upper Abs,Lower Abs,Transverse Abdominis,Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/35-bow-pose-how-to-do-exercise"
        },
        1053=> {
            "name"=> "BOSU Squat Hopovers",
            "primary"=> "Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Adductors,Abductors",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1178-bosu-squat-hopovers-how-to-do-exercise"
        },
        1054=> {
            "name"=> "Bottom to Bottom Squats",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/531-bottom-to-bottom-squats-how-to-do-exercise"
        },
        1055=> {
            "name"=> "BOSU Squats",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Hamstrings,Calves",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1205-bosu-squats-how-to-do-exercise"
        },
        1056=> {
            "name"=> "Buddy Wall Sit",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/2120-buddy-wall-sit-how-to-do-exercise"
        },
        1057=> {
            "name"=> "Bulgarian Split Squats",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Glute Max,Calves",
            "tags"=> "Chair,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1082-bulgarian-split-squats-how-to-do-exercise"
        },
        1058=> {
            "name"=> "Butt Kickers",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1021-butt-kickers-how-to-do-exercise"
        },
        1059=> {
            "name"=> "Chair Pose",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Upper Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/291-chair-pose-how-to-do-exercise"
        },
        1060=> {
            "name"=> "Chair Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1074-chair-squats-how-to-do-exercise"
        },
        1061=> {
            "name"=> "Cool Down Cycling",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/1729-cool-down-cycling-how-to-do-exercise"
        },
        1062=> {
            "name"=> "Deep Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/988-deep-lunges-how-to-do-exercise"
        },
        1063=> {
            "name"=> "Diamond Shapes",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Calves",
            "tags"=> "Chair,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1994-diamond-shapes-how-to-do-exercise"
        },
        1064=> {
            "name"=> "Cycling",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves",
            "tags"=> "Cardio Machine,Biking,Gym Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1728-cycling-how-to-do-exercise"
        },
        1065=> {
            "name"=> "Double Stair Steps",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves,Lower Back",
            "tags"=> "Cardio Machine,Gym Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1982-double-stair-steps-how-to-do-exercise"
        },
        1066=> {
            "name"=> "Drop Squats",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1017-drop-squats-how-to-do-exercise"
        },
        1067=> {
            "name"=> "Dumbbell Split Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "Dumbbells,Home Equipment,Gym Equipment,Cardio,Strength",
            "url"=> "https://www.skimble.com/exercises/672-dumbbell-split-jumps-how-to-do-exercise"
        },
        1068=> {
            "name"=> "Dynamic Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2017-dynamic-lunges-how-to-do-exercise"
        },
        1069=> {
            "name"=> "Dumbbell Step-Ups",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Dumbbells,Box or Step",
            "tags"=> "Home Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/811-dumbbell-step-ups-how-to-do-exercise"
        },
        1070=> {
            "name"=> "Farmer's Walk",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1744-farmers-walk-how-to-do-exercise"
        },
        1071=> {
            "name"=> "Dumbbell Lunges",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Glute Max",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/886-dumbbell-lunges-how-to-do-exercise"
        },
        1072=> {
            "name"=> "Dumbbell Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Lower Back",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/36-dumbbell-squats-how-to-do-exercise"
        },
        1073=> {
            "name"=> "Elliptical",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Hamstrings,Lower Back",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2424-elliptical-how-to-do-exercise"
        },
        1074=> {
            "name"=> "Fast Cycling",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/1702-fast-cycling-how-to-do-exercise"
        },
        1075=> {
            "name"=> "Fast Elliptical",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Required Equipment: Cardio Machine",
            "tags"=> "Running,Strength,",
            "url"=> "https://www.skimble.com/exercises/1698-fast-elliptical-how-to-do-exercise"
        },
        1076=> {
            "name"=> "Forward Dragon Squats",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Abductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2013-forward-dragon-squats-how-to-do-exercise"
        },
        1077=> {
            "name"=> "Hack Squats",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Glute Max,Back Extensors",
            "tags"=> "Barbells,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/226-hack-squats-how-to-do-exercise"
        },
        1078=> {
            "name"=> "Front Kicks",
            "primary"=> "Glute Max,Hip Flexors,Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1195-front-kicks-how-to-do-exercise"
        },
        1079=> {
            "name"=> "Glute Reverse Lunges",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Calves,Abductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2141-glute-reverse-lunges-how-to-do-exercise"
        },
        1080=> {
            "name"=> "Heron Pose",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Glute Max,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1273-heron-pose-how-to-do-exercise"
        },
        1081=> {
            "name"=> "Fast Stair Steps",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Cardio Machine,Gym Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1979-fast-stair-steps-how-to-do-exercise"
        },
        1082=> {
            "name"=> "Front Hop Overs",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Calves,Dorsiflexors,Abductors,Plantar Flexors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2369-front-hop-overs-how-to-do-exercise"
        },
        1083=> {
            "name"=> "Glute Twist Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1881-glute-twist-lunges-how-to-do-exercise"
        },
        1084=> {
            "name"=> "Hero Pose",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1272-hero-pose-how-to-do-exercise"
        },
        1085=> {
            "name"=> "Gate Swings",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Adductors,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1018-gate-swings-how-to-do-exercise"
        },
        1086=> {
            "name"=> "High Kicks and Punches",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Cardio,Kickboxing,",
            "url"=> "https://www.skimble.com/exercises/2446-high-kicks-and-punches-how-to-do-exercise"
        },
        1087=> {
            "name"=> "Incline Jog on Treadmill",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1976-incline-jog-on-treadmill-how-to-do-exercise"
        },
        1088=> {
            "name"=> "Jack Jump Tucks",
            "primary"=> "Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Front Shoulders,Upper Chest,Glute Max",
            "tags"=> "No Equipment,Bodyweight,Crossfit,Cardio",
            "url"=> "https://www.skimble.com/exercises/1156-jack-jump-tucks-how-to-do-exercise"
        },
        1089=> {
            "name"=> "Jogging",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Dorsiflexors,Plantar Flexors",
            "tags"=> "No Equipment,Warmup,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1413-jogging-how-to-do-exercise"
        },
        1090=> {
            "name"=> "Jazz Kicks",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Side Shoulders",
            "tags"=> "No Equipment,Dance",
            "url"=> "https://www.skimble.com/exercises/1666-jazz-kicks-how-to-do-exercise"
        },
        1091=> {
            "name"=> "Jump for Joy",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/990-jump-for-joy-how-to-do-exercise"
        },
        1092=> {
            "name"=> "Incline Walk on Treadmill",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Glute Max,Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1975-incline-walk-on-treadmill-how-to-do-exercise"
        },
        1093=> {
            "name"=> "High Knee Pulls",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,Cardio,",
            "url"=> "https://www.skimble.com/exercises/977-high-knee-pulls-how-to-do-exercise"
        },
        1094=> {
            "name"=> "Hip Flexor & Extension",
            "primary"=> "Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Dorsiflexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2146-hip-flexor-extension-how-to-do-exercise"
        },
        1095=> {
            "name"=> "Inverted Flyers",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Upper Abs,Lower Abs,Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1882-inverted-flyers-how-to-do-exercise"
        },
        1096=> {
            "name"=> "Hip Raises on Ball",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Lower Back",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1371-hip-raises-on-ball-how-to-do-exercise"
        },
        1097=> {
            "name"=> "Jog on the Spot",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/965-jog-on-the-spot-how-to-do-exercise"
        },
        1098=> {
            "name"=> "Kettlebell Goblet Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Front Shoulders,Hamstrings",
            "tags"=> "Kettlebells,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/1601-kettlebell-goblet-squats-how-to-do-exercise"
        },
        1099=> {
            "name"=> "Lateral Power Step Ups",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "Box or Step,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2051-lateral-power-step-ups-how-to-do-exercise"
        },
        1100=> {
            "name"=> "Lateral Hop Overs",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Calves,Dorsiflexors,Abductors,Plantar Flexors",
            "tags"=> "Box or Step,Bodyweight,Home Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/2368-lateral-hop-overs-how-to-do-exercise"
        },
        1101=> {
            "name"=> "Kettlebell Swings",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Transverse Abdominis,Lats",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/818-kettlebell-swings-how-to-do-exercise"
        },
        1102=> {
            "name"=> "Lateral Hops to Stabilization",
            "primary"=> "Quads",
            "secondary"=> "Quads,Hamstrings,Calves,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1095-lateral-hops-to-stabilization-how-to-do-exercise"
        },
        1103=> {
            "name"=> "Left Assisted Lunges",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Glute Max,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/757-left-assisted-lunges-how-to-do-exercise"
        },
        1104=> {
            "name"=> "Left Hip Flexor Stretch",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/871-left-hip-flexor-stretch-how-to-do-exercise"
        },
        1105=> {
            "name"=> "Left Crescent to Low Lunge",
            "primary"=> "Glute Max,Hip Flexors,Quads",
            "secondary"=> "Side Shoulders,Front Shoulders,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1612-left-crescent-to-low-lunge-how-to-do-exercise"
        },
        1106=> {
            "name"=> "Left Head to Ankle",
            "primary"=> "Quads",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1912-left-head-to-ankle-how-to-do-exercise"
        },
        1107=> {
            "name"=> "Left Leg Bulgarian Squats with Stability Ball",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1313-left-leg-bulgarian-squats-with-stability-ball-how-to-do-exercise"
        },
        1108=> {
            "name"=> "Left Leg Squats with Stability Ball",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1311-left-leg-squats-with-stability-ball-how-to-do-exercise"
        },
        1109=> {
            "name"=> "Left Leg Front-and-Back Lunges",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Calves",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1040-left-leg-front-and-back-lunges-how-to-do-exercise"
        },
        1110=> {
            "name"=> "Left Lunges with Kettlebell",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Lats,Back Extensors",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/5847-left-lunges-with-kettlebell-how-to-do-exercise"
        },
        1111=> {
            "name"=> "Left Pigeon Leg",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Lower Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2416-left-pigeon-leg-how-to-do-exercise"
        },
        1112=> {
            "name"=> "Left Reverse Lunges with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Hamstrings",
            "tags"=> "Kettlebells,Strength",
            "url"=> "https://www.skimble.com/exercises/1553-left-reverse-lunges-with-kettlebell-how-to-do-exercise"
        },
        1113=> {
            "name"=> "Left Lunge",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hip Flexors,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1841-left-lunge-how-to-do-exercise"
        },
        1114=> {
            "name"=> "Left Leg Front Step Up",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Abductors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2363-left-leg-front-step-up-how-to-do-exercise"
        },
        1115=> {
            "name"=> "Left Leg Squats",
            "primary"=> "Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1212-left-leg-squats-how-to-do-exercise"
        },
        1116=> {
            "name"=> "Left Leg Front Kicks",
            "primary"=> "Glute Max,Hip Flexors,Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1197-left-leg-front-kicks-how-to-do-exercise"
        },
        1117=> {
            "name"=> "Left Low Lunge",
            "primary"=> "Quads",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1872-left-low-lunge-how-to-do-exercise"
        },
        1118=> {
            "name"=> "Left Quad Stretch",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/854-left-quad-stretch-how-to-do-exercise"
        },
        1119=> {
            "name"=> "Left Suitcase Squats with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Wrist Flexors,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1605-left-suitcase-squats-with-kettlebell-how-to-do-exercise"
        },
        1120=> {
            "name"=> "Leg Press",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: Strength Machine",
            "tags"=> "Exercise Machine,Strength,",
            "url"=> "https://www.skimble.com/exercises/559-leg-press-how-to-do-exercise"
        },
        1121=> {
            "name"=> "Lunges to Squats",
            "primary"=> "Glute Max,Quads,Lower Back",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2453-lunges-to-squats-how-to-do-exercise"
        },
        1122=> {
            "name"=> "Lunges on Treadmill",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1974-lunges-on-treadmill-how-to-do-exercise"
        },
        1123=> {
            "name"=> "Low-Bar Back Squats",
            "primary"=> "Glute Max,Quads,Lower Back",
            "secondary"=> "Hamstrings",
            "tags"=> "Barbells,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/37386-low-bar-back-squats-how-to-do-exercise"
        },
        1124=> {
            "name"=> "Left Side Kicks",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Adductors,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1184-left-side-kicks-how-to-do-exercise"
        },
        1125=> {
            "name"=> "Left Split Jumps",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1216-left-split-jumps-how-to-do-exercise"
        },
        1126=> {
            "name"=> "Left Suitcase Split Squats with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Right Obliques,Hamstrings",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1576-left-suitcase-split-squats-with-kettlebell-how-to-do-exercise"
        },
        1127=> {
            "name"=> "Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/2242-lunges-how-to-do-exercise"
        },
        1128=> {
            "name"=> "Lunges with Knee Lifts",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Transverse Abdominis,Hamstrings",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/855-lunges-with-knee-lifts-how-to-do-exercise"
        },
        1129=> {
            "name"=> "Lunges with Rotation",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Left Obliques,Right Obliques,Transverse Abdominis,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1575-lunges-with-rotation-how-to-do-exercise"
        },
        1130=> {
            "name"=> "Max Biking",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/1732-max-biking-how-to-do-exercise"
        },
        1131=> {
            "name"=> "Max Rep Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1288-max-rep-squats-how-to-do-exercise"
        },
        1132=> {
            "name"=> "Moderate Stairs",
            "primary"=> "Quads",
            "secondary"=> "Glute Max,Calves",
            "tags"=> "Cardio Machine,Gym Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1980-moderate-stairs-how-to-do-exercise"
        },
        1133=> {
            "name"=> "Narrow Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2127-narrow-squats-how-to-do-exercise"
        },
        1134=> {
            "name"=> "Pistols",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/912-pistols-how-to-do-exercise"
        },
        1135=> {
            "name"=> "Max Elliptical",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Cardio Machine,Exercise Machine,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1730-max-elliptical-how-to-do-exercise"
        },
        1136=> {
            "name"=> "Medicine Ball Side Step Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Neck Flexors",
            "tags"=> "Medicine Ball,Strength",
            "url"=> "https://www.skimble.com/exercises/1963-medicine-ball-side-step-squats-how-to-do-exercise"
        },
        1137=> {
            "name"=> "Medicine Ball Pullovers on Stability Ball",
            "primary"=> "Lats,Glute Max,Quads",
            "secondary"=> "Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis,Hamstrings",
            "tags"=> "Stability Ball,Medicine Ball,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1559-medicine-ball-pullovers-on-stability-ball-how-to-do-exercise"
        },
        1138=> {
            "name"=> "March in Place",
            "primary"=> "Quads",
            "secondary"=> "Glute Max",
            "tags"=> "Chair,Bodyweight,Home Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1052-march-in-place-how-to-do-exercise"
        },
        1139=> {
            "name"=> "Monkey Walks",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Adductors,Calves,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1657-monkey-walks-how-to-do-exercise"
        },
        1140=> {
            "name"=> "Max Rep Deep Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Calves,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1289-max-rep-deep-squats-how-to-do-exercise"
        },
        1141=> {
            "name"=> "Medicine Ball Reverse Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "Medicine Ball,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1965-medicine-ball-reverse-lunges-how-to-do-exercise"
        },
        1142=> {
            "name"=> "Moderate Cycling",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves",
            "tags"=> "Cardio Machine,Biking,Cardio",
            "url"=> "https://www.skimble.com/exercises/1701-moderate-cycling-how-to-do-exercise"
        },
        1143=> {
            "name"=> "Power Step Ups",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Abductors",
            "tags"=> "Box or Step,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2050-power-step-ups-how-to-do-exercise"
        },
        1144=> {
            "name"=> "Plyo Jacks",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/2018-plyo-jacks-how-to-do-exercise"
        },
        1145=> {
            "name"=> "Quick Toe Taps on Step",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Calves,Plantar Flexors,Knee Flexors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2375-quick-toe-taps-on-step-how-to-do-exercise"
        },
        1146=> {
            "name"=> "Quad Stretch in Left Twisting Low Lunge",
            "primary"=> "Quads",
            "secondary"=> "Hip Flexors,Hamstrings,Knee Flexors",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3010-quad-stretch-in-left-twisting-low-lunge-how-to-do-exercise"
        },
        1147=> {
            "name"=> "Quad Stretches",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/795-quad-stretches-how-to-do-exercise"
        },
        1148=> {
            "name"=> "Reclining Hero",
            "primary"=> "Quads",
            "secondary"=> "Adductors,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1263-reclining-hero-how-to-do-exercise"
        },
        1149=> {
            "name"=> "Reverse Lunge to Left Side Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/2143-reverse-lunge-to-left-side-lunges-how-to-do-exercise"
        },
        1150=> {
            "name"=> "Quad Stretch in Right Low Lunge",
            "primary"=> "Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3285-quad-stretch-in-right-low-lunge-how-to-do-exercise"
        },
        1151=> {
            "name"=> "Plyo Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2145-plyo-lunges-how-to-do-exercise"
        },
        1152=> {
            "name"=> "Pop Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2008-pop-squats-how-to-do-exercise"
        },
        1153=> {
            "name"=> "Power Walk",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves,Dorsiflexors",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/9-power-walk-how-to-do-exercise"
        },
        1154=> {
            "name"=> "Quad Rolls",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1435-quad-rolls-how-to-do-exercise"
        },
        1155=> {
            "name"=> "Power Squats",
            "primary"=> "Glute Max,Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Adductors,Abductors",
            "tags"=> "Barbells,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/50083-power-squats-how-to-do-exercise"
        },
        1156=> {
            "name"=> "Plyo Lunges with Knee Lifts",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2206-plyo-lunges-with-knee-lifts-how-to-do-exercise"
        },
        1157=> {
            "name"=> "Quad Stretch in Left Low Lunge",
            "primary"=> "Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3286-quad-stretch-in-left-low-lunge-how-to-do-exercise"
        },
        1158=> {
            "name"=> "Prisoner Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Crossfit",
            "url"=> "https://www.skimble.com/exercises/292-prisoner-squats-how-to-do-exercise"
        },
        1159=> {
            "name"=> "Quad Stretch in Right Twisting Low Lunge",
            "primary"=> "Quads",
            "secondary"=> "Hip Flexors,Hamstrings,Knee Flexors",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3009-quad-stretch-in-right-twisting-low-lunge-how-to-do-exercise"
        },
        1160=> {
            "name"=> "Quick Feet",
            "primary"=> "Hip Flexors,Quads,Plantar Flexors",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2012-quick-feet-how-to-do-exercise"
        },
        1161=> {
            "name"=> "Reverse Lunge to Right Side Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/2142-reverse-lunge-to-right-side-lunges-how-to-do-exercise"
        },
        1162=> {
            "name"=> "Reverse Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/989-reverse-lunges-how-to-do-exercise"
        },
        1163=> {
            "name"=> "Right Arm Kettlebell Swings",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Triceps,Transverse Abdominis,Traps,Hamstrings",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/1566-right-arm-kettlebell-swings-how-to-do-exercise"
        },
        1164=> {
            "name"=> "Right Assisted Lunges",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/448-right-assisted-lunges-how-to-do-exercise"
        },
        1165=> {
            "name"=> "Right Bulgarian Split Squats with Dumbbells",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Dumbbells,Box or Step,Home Equipment,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1431-right-bulgarian-split-squats-with-dumbbells-how-to-do-exercise"
        },
        1166=> {
            "name"=> "Right Crescent to Low Lunge",
            "primary"=> "Glute Max,Hip Flexors,Quads",
            "secondary"=> "Side Shoulders,Front Shoulders,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1618-right-crescent-to-low-lunge-how-to-do-exercise"
        },
        1167=> {
            "name"=> "Right Head to Ankle",
            "primary"=> "Quads",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1911-right-head-to-ankle-how-to-do-exercise"
        },
        1168=> {
            "name"=> "Right Hip Flexor Stretch",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/870-right-hip-flexor-stretch-how-to-do-exercise"
        },
        1169=> {
            "name"=> "Right Leg Balance with Eyes Closed",
            "primary"=> "Quads",
            "secondary"=> "Transverse Abdominis,Glute Max,Adductors,Hamstrings,Calves,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/997-right-leg-balance-with-eyes-closed-how-to-do-exercise"
        },
        1170=> {
            "name"=> "Right Lawnmower with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Rear Shoulders,Biceps,Traps,Hamstrings,Lower Back,Rhomboids",
            "tags"=> "Kettlebells,Strength",
            "url"=> "https://www.skimble.com/exercises/1581-right-lawnmower-with-kettlebell-how-to-do-exercise"
        },
        1171=> {
            "name"=> "Right Leg Bulgarian Squats with Stability Ball",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1312-right-leg-bulgarian-squats-with-stability-ball-how-to-do-exercise"
        },
        1172=> {
            "name"=> "Right Leg Front Step Up",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Adductors,Abductors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2364-right-leg-front-step-up-how-to-do-exercise"
        },
        1173=> {
            "name"=> "Right Leg Front Kicks",
            "primary"=> "Hip Flexors,Quads",
            "secondary"=> "Glute Max,Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1196-right-leg-front-kicks-how-to-do-exercise"
        },
        1174=> {
            "name"=> "Right Leg Quad Rolls",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1380-right-leg-quad-rolls-how-to-do-exercise"
        },
        1175=> {
            "name"=> "Right Leg Squats",
            "primary"=> "Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1211-right-leg-squats-how-to-do-exercise"
        },
        1176=> {
            "name"=> "Right Lunges with Kettlebell",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Lats,Hip Flexors,Back Extensors",
            "tags"=> "Kettlebells,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/5846-right-lunges-with-kettlebell-how-to-do-exercise"
        },
        1177=> {
            "name"=> "Right Lunge with Kettlebell Rows",
            "primary"=> "Rear Shoulders,Glute Max,Quads",
            "secondary"=> "Side Shoulders,Triceps,Biceps,Hamstrings,Lower Back,Rhomboids",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1550-right-lunge-with-kettlebell-rows-how-to-do-exercise"
        },
        1178=> {
            "name"=> "Right Lunge",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/178-right-lunge-how-to-do-exercise"
        },
        1179=> {
            "name"=> "Right Leg Squats with Stability Ball",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1310-right-leg-squats-with-stability-ball-how-to-do-exercise"
        },
        1180=> {
            "name"=> "Right Reverse Lunges with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Hamstrings",
            "tags"=> "Kettlebells,Strength",
            "url"=> "https://www.skimble.com/exercises/1549-right-reverse-lunges-with-kettlebell-how-to-do-exercise"
        },
        1181=> {
            "name"=> "Right Pigeon Leg",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Lower Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2415-right-pigeon-leg-how-to-do-exercise"
        },
        1182=> {
            "name"=> "Right Suitcase Squats with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Wrist Flexors,Left Obliques,Traps,Hamstrings,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1604-right-suitcase-squats-with-kettlebell-how-to-do-exercise"
        },
        1183=> {
            "name"=> "Right Split Jumps",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors",
            "tags"=> "No Equipment,Bodyweight,Balance,Cardio",
            "url"=> "https://www.skimble.com/exercises/1215-right-split-jumps-how-to-do-exercise"
        },
        1184=> {
            "name"=> "Right Side Kicks",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Neck Flexors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1111-right-side-kicks-how-to-do-exercise"
        },
        1185=> {
            "name"=> "Right Quad Stretch",
            "primary"=> "Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/853-right-quad-stretch-how-to-do-exercise"
        },
        1186=> {
            "name"=> "Right Suitcase Split Squats with Kettlebell",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Hamstrings",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1547-right-suitcase-split-squats-with-kettlebell-how-to-do-exercise"
        },
        1187=> {
            "name"=> "Runners Walking Lunges",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Warmup,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1818-runners-walking-lunges-how-to-do-exercise"
        },
        1188=> {
            "name"=> "Sandbag Drag",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Transverse Abdominis,Lats,Calves,Lower Back",
            "tags"=> "Sandbags,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/56-sandbag-drag-how-to-do-exercise"
        },
        1189=> {
            "name"=> "Seated Single Leg Stand Ups",
            "primary"=> "Quads",
            "secondary"=> "Glute Max",
            "tags"=> "Chair,Bodyweight,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1070-seated-single-leg-stand-ups-how-to-do-exercise"
        },
        1190=> {
            "name"=> "Seesaw Squats with Clap",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/2057-seesaw-squats-with-clap-how-to-do-exercise"
        },
        1191=> {
            "name"=> "Seated Knee Raises",
            "primary"=> "Quads",
            "secondary"=> "Glute Max",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1051-seated-knee-raises-how-to-do-exercise"
        },
        1192=> {
            "name"=> "Seesaw Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/1661-seesaw-squats-how-to-do-exercise"
        },
        1193=> {
            "name"=> "Running",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Dorsiflexors,Plantar Flexors",
            "tags"=> "No Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/2436-running-how-to-do-exercise"
        },
        1194=> {
            "name"=> "Seated Box Jumps",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Box or Step,Bench",
            "tags"=> "Crossfit,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/6833-seated-box-jumps-how-to-do-exercise"
        },
        1195=> {
            "name"=> "Seated Leg Lifts",
            "primary"=> "Lower Abs,Hip Flexors,Quads",
            "secondary"=> "Upper Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1104-seated-leg-lifts-how-to-do-exercise"
        },
        1196=> {
            "name"=> "Seesaw Squats with Alternating Clasps",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Calves,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Partner",
            "url"=> "https://www.skimble.com/exercises/2058-seesaw-squats-with-alternating-clasps-how-to-do-exercise"
        },
        1197=> {
            "name"=> "Side Shuffles",
            "primary"=> "Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Warmup,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1073-side-shuffles-how-to-do-exercise"
        },
        1198=> {
            "name"=> "Slow Backwards Elliptical",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Cardio Machine",
            "tags"=> "Gym Equipment,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1699-slow-backwards-elliptical-how-to-do-exercise"
        },
        1199=> {
            "name"=> "Sprint",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Dorsiflexors,Plantar Flexors",
            "tags"=> "No Equipment,Bodyweight,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/18-sprint-how-to-do-exercise"
        },
        1200=> {
            "name"=> "Squat Hops with a Half Turn",
            "primary"=> "Quads,Neck Flexors",
            "secondary"=> "Quads,Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1093-squat-hops-with-a-half-turn-how-to-do-exercise"
        },
        1201=> {
            "name"=> "Split Squats with Band",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Lower Back",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/1992-split-squats-with-band-how-to-do-exercise"
        },
        1202=> {
            "name"=> "Single-Leg Squat Touchdowns",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Transverse Abdominis,Adductors",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/914-single-leg-squat-touchdowns-how-to-do-exercise"
        },
        1203=> {
            "name"=> "Single Leg Lateral Hop Overs",
            "primary"=> "Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2367-single-leg-lateral-hop-overs-how-to-do-exercise"
        },
        1204=> {
            "name"=> "Split Squats",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Transverse Abdominis,Adductors,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/996-split-squats-how-to-do-exercise"
        },
        1205=> {
            "name"=> "Squat Hops with a Quarter Turn",
            "primary"=> "Quads,Neck Flexors",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight,Balance",
            "url"=> "https://www.skimble.com/exercises/1094-squat-hops-with-a-quarter-turn-how-to-do-exercise"
        },
        1206=> {
            "name"=> "Squat Side Kicks",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hip Flexors,Adductors,Hamstrings,Abductors",
            "tags"=> "No Equipment,Bodyweight,Cardio,Kickboxing",
            "url"=> "https://www.skimble.com/exercises/1200-squat-side-kicks-how-to-do-exercise"
        },
        1207=> {
            "name"=> "Squat Jacks",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Side Shoulders,Adductors,Calves,Lower Back",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/268-squat-jacks-how-to-do-exercise"
        },
        1208=> {
            "name"=> "Squats with Raised Arms",
            "primary"=> "Lats,Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Lower Back",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/978-squats-with-raised-arms-how-to-do-exercise"
        },
        1209=> {
            "name"=> "Stairs Steps with Leg Extensions",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves,Lower Back",
            "tags"=> "Cardio Machine,Gym Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1981-stairs-steps-with-leg-extensions-how-to-do-exercise"
        },
        1210=> {
            "name"=> "Step-Ups",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Neck Flexors",
            "tags"=> "Box or Step,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/382-step-ups-how-to-do-exercise"
        },
        1211=> {
            "name"=> "Standing Head to Knee Pose",
            "primary"=> "Lats,Glute Max,Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Traps,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2251-standing-head-to-knee-pose-how-to-do-exercise"
        },
        1212=> {
            "name"=> "Stair Climbs",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/2283-stair-climbs-how-to-do-exercise"
        },
        1213=> {
            "name"=> "Standing Back Bend",
            "primary"=> "Middle Chest,Lats,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1687-standing-back-bend-how-to-do-exercise"
        },
        1214=> {
            "name"=> "Squat Thrusts",
            "primary"=> "Middle Chest,Quads",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/626-squat-thrusts-how-to-do-exercise"
        },
        1215=> {
            "name"=> "Squats with Band",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves,Lower Back",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2349-squats-with-band-how-to-do-exercise"
        },
        1216=> {
            "name"=> "Squats",
            "primary"=> "Glute Max,Quads,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Adductors,Calves,Abductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/34-squats-how-to-do-exercise"
        },
        1217=> {
            "name"=> "Standing Pigeon",
            "primary"=> "Quads,Piriformis",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Stretching,",
            "url"=> "https://www.skimble.com/exercises/302-standing-pigeon-how-to-do-exercise"
        },
        1218=> {
            "name"=> "Stretch After Thigh Work",
            "primary"=> "Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Yoga,Pilates,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1998-stretch-after-thigh-work-how-to-do-exercise"
        },
        1219=> {
            "name"=> "Suitcase Squats",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Neck Flexors",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1101-suitcase-squats-how-to-do-exercise"
        },
        1220=> {
            "name"=> "The Heisman Shuffle",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "No Equipment,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/1693-the-heisman-shuffle-how-to-do-exercise"
        },
        1221=> {
            "name"=> "Tabata Squats",
            "primary"=> "Glute Max,Quads,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Adductors,Calves,Abductors",
            "tags"=> "Bodyweight,Crossfit,Cardio,",
            "url"=> "https://www.skimble.com/exercises/50082-tabata-squats-how-to-do-exercise"
        },
        1222=> {
            "name"=> "Sumo Squats with Kettlebell",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Adductors,Lower Back",
            "tags"=> "Kettlebells,Strength",
            "url"=> "https://www.skimble.com/exercises/1567-sumo-squats-with-kettlebell-how-to-do-exercise"
        },
        1223=> {
            "name"=> "Toe Stand",
            "primary"=> "Glute Max,Hip Flexors,Quads",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2258-toe-stand-how-to-do-exercise"
        },
        1224=> {
            "name"=> "Treadmill Walk",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Warmup,Cooldown,Cardio",
            "url"=> "https://www.skimble.com/exercises/1969-treadmill-walk-how-to-do-exercise"
        },
        1225=> {
            "name"=> "Triangle Pose",
            "primary"=> "Glute Max,Hip Flexors,Quads",
            "secondary"=> "Side Shoulders,Rear Shoulders,Lats",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2255-triangle-pose-how-to-do-exercise"
        },
        1226=> {
            "name"=> "Total Body ARC Trainer",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Triceps,Biceps,Traps",
            "tags"=> "Cardio Machine,Warmup,Cooldown,Exercise Machine,Home Equipment,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/44412-total-body-arc-trainer-how-to-do-exercise"
        },
        1227=> {
            "name"=> "Treadmill Slow Jogging",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Hip Flexors,Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1972-treadmill-slow-jogging-how-to-do-exercise"
        },
        1228=> {
            "name"=> "Treadmill Moderate Jog",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Upper Chest,Middle Chest,Lower Chest,Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "Cardio Machine,Cardio",
            "url"=> "https://www.skimble.com/exercises/1970-treadmill-moderate-jog-how-to-do-exercise"
        },
        1229=> {
            "name"=> "The Heisman",
            "primary"=> "Glute Max,Hip Flexors,Quads,Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1667-the-heisman-how-to-do-exercise"
        },
        1230=> {
            "name"=> "Walking",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Calves,Dorsiflexors,Plantar Flexors",
            "tags"=> "No Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/2435-walking-how-to-do-exercise"
        },
        1231=> {
            "name"=> "Walking Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight,Crossfit,Balance",
            "url"=> "https://www.skimble.com/exercises/222-walking-lunges-how-to-do-exercise"
        },
        1232=> {
            "name"=> "Warm-Up Elliptical",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Required Equipment: Cardio Machine",
            "tags"=> "Warmup,Running,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1697-warm-up-elliptical-how-to-do-exercise"
        },
        1233=> {
            "name"=> "Wall Sits with Knee Raises",
            "primary"=> "Quads,Neck Flexors",
            "secondary"=> "Lower Abs",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1088-wall-sits-with-knee-raises-how-to-do-exercise"
        },
        1234=> {
            "name"=> "Wall Sits with Leg Lifts",
            "primary"=> "Quads,Neck Flexors",
            "secondary"=> "Lower Abs,Hamstrings",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1089-wall-sits-with-leg-lifts-how-to-do-exercise"
        },
        1235=> {
            "name"=> "Weighted Plie Squats",
            "primary"=> "Glute Max,Quads,Abductors",
            "secondary"=> "Adductors,Hamstrings,Lower Back",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2011-weighted-plie-squats-how-to-do-exercise"
        },
        1236=> {
            "name"=> "Walking Dumbbell Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/498-walking-dumbbell-lunges-how-to-do-exercise"
        },
        1237=> {
            "name"=> "Wall Sit",
            "primary"=> "Quads,Hamstrings",
            "secondary"=> "Glute Max",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/804-wall-sit-how-to-do-exercise"
        },
        1238=> {
            "name"=> "Walking Squats",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2210-walking-squats-how-to-do-exercise"
        },
        1239=> {
            "name"=> "Twisting Lunges",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Left Obliques,Right Obliques,Hamstrings,Calves",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1887-twisting-lunges-how-to-do-exercise"
        },
        1240=> {
            "name"=> "Wall Ball Squats",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Stability Ball,Wall,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/884-wall-ball-squats-how-to-do-exercise"
        },
        1241=> {
            "name"=> "Wall Sits with Heel Ups",
            "primary"=> "Hip Flexors,Quads",
            "secondary"=> "Calves",
            "tags"=> "Wall,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1090-wall-sits-with-heel-ups-how-to-do-exercise"
        },
        1242=> {
            "name"=> "Warm Up Stair Steps",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Calves",
            "tags"=> "Cardio Machine,Gym Equipment,Cardio",
            "url"=> "https://www.skimble.com/exercises/1977-warm-up-stair-steps-how-to-do-exercise"
        },
        1243=> {
            "name"=> "Wide Squat Holds",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Abductors,Knee Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2009-wide-squat-holds-how-to-do-exercise"
        },
        1244=> {
            "name"=> "Body Circles",
            "primary"=> "Lower Chest,Lower Back",
            "secondary"=> "Neck Flexors",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/984-body-circles-how-to-do-exercise"
        },
        1245=> {
            "name"=> "Barbell Back Loaded Squats",
            "primary"=> "Quads,Lower Back",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1669-barbell-back-loaded-squats-how-to-do-exercise"
        },
        1246=> {
            "name"=> "Ball Back Extensions",
            "primary"=> "Lats,Lower Back,Back Extensors",
            "secondary"=> "Side Shoulders,Rear Shoulders,Traps,Rhomboids",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1302-ball-back-extensions-how-to-do-exercise"
        },
        1247=> {
            "name"=> "Ball Arch",
            "primary"=> "Lower Back",
            "secondary"=> "Upper Chest,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1620-ball-arch-how-to-do-exercise"
        },
        1248=> {
            "name"=> "Ball Bird Dog",
            "primary"=> "Glute Max,Lower Back,Back Extensors",
            "secondary"=> "Side Shoulders,Rear Shoulders,Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1622-ball-bird-dog-how-to-do-exercise"
        },
        1249=> {
            "name"=> "Barbell Deadlift",
            "primary"=> "Lower Back,Back Extensors",
            "secondary"=> "Wrist Flexors,Traps,Lats,Glute Max,Quads,Hamstrings,Calves,Wrist Extensors",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1703-barbell-deadlift-how-to-do-exercise"
        },
        1250=> {
            "name"=> "Child's Pose",
            "primary"=> "Lower Back",
            "secondary"=> "Lats,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/815-childs-pose-how-to-do-exercise"
        },
        1251=> {
            "name"=> "Child's Pose with Side Reaches",
            "primary"=> "Lats,Lower Back",
            "secondary"=> "Side Shoulders",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1592-childs-pose-with-side-reaches-how-to-do-exercise"
        },
        1252=> {
            "name"=> "Child's Pose with Reverse Prayer",
            "primary"=> "Lower Back",
            "secondary"=> "Side Shoulders,Rear Shoulders,Lats,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1279-childs-pose-with-reverse-prayer-how-to-do-exercise"
        },
        1253=> {
            "name"=> "Double Leg Stretch",
            "primary"=> "Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1347-double-leg-stretch-how-to-do-exercise"
        },
        1254=> {
            "name"=> "Jefferson Curls",
            "primary"=> "Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Traps,Glute Max,Quads",
            "tags"=> "Dumbbells,Kettlebells,Home Equipment,Crossfit,Stretching",
            "url"=> "https://www.skimble.com/exercises/35995-jefferson-curls-how-to-do-exercise"
        },
        1255=> {
            "name"=> "Kettlebell Deadlifts",
            "primary"=> "Glute Max,Hamstrings,Lower Back",
            "secondary"=> "Supinator,Wrist Flexors,Upper Abs,Lower Abs,Hip Flexors,Adductors,Quads,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1372-kettlebell-deadlifts-how-to-do-exercise"
        },
        1256=> {
            "name"=> "Hip Raises with Dumbbells",
            "primary"=> "Glute Max,Hamstrings,Lower Back",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Dumbbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2397-hip-raises-with-dumbbells-how-to-do-exercise"
        },
        1257=> {
            "name"=> "Legs Up Position",
            "primary"=> "Hamstrings,Lower Back",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Stretching,",
            "url"=> "https://www.skimble.com/exercises/1391-legs-up-position-how-to-do-exercise"
        },
        1258=> {
            "name"=> "Legs up the Wall",
            "primary"=> "Hamstrings,Lower Back",
            "secondary"=> "Required Equipment: Wall",
            "tags"=> "Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/2414-legs-up-the-wall-how-to-do-exercise"
        },
        1259=> {
            "name"=> "Left Rockstar",
            "primary"=> "Glute Max,Lower Back",
            "secondary"=> "Side Shoulders,Rear Shoulders,Quads,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1937-left-rockstar-how-to-do-exercise"
        },
        1260=> {
            "name"=> "Look up with Arched Back",
            "primary"=> "Lats,Hamstrings,Lower Back",
            "secondary"=> "Calves",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1210-look-up-with-arched-back-how-to-do-exercise"
        },
        1261=> {
            "name"=> "Plow Pose",
            "primary"=> "Lats,Lower Back",
            "secondary"=> "Glute Max,Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/924-plow-pose-how-to-do-exercise"
        },
        1262=> {
            "name"=> "Lying Torso Twists",
            "primary"=> "Glute Max,Lower Back",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/994-lying-torso-twists-how-to-do-exercise"
        },
        1263=> {
            "name"=> "Right Rockstar",
            "primary"=> "Glute Max,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1390-right-rockstar-how-to-do-exercise"
        },
        1264=> {
            "name"=> "Reclining Big Toe Sequence",
            "primary"=> "Glute Max,Hip Flexors,Lower Back",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1926-reclining-big-toe-sequence-how-to-do-exercise"
        },
        1265=> {
            "name"=> "Single Leg Partner Deadlifts with Ball",
            "primary"=> "Glute Max,Hamstrings,Lower Back",
            "secondary"=> "Required Equipment: Medicine Ball",
            "tags"=> "Home Equipment,Balance,Partner,",
            "url"=> "https://www.skimble.com/exercises/2135-single-leg-partner-deadlifts-with-ball-how-to-do-exercise"
        },
        1266=> {
            "name"=> "Simple Seated Twist",
            "primary"=> "Left Obliques,Right Obliques,Lats,Lower Back",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1900-simple-seated-twist-how-to-do-exercise"
        },
        1267=> {
            "name"=> "Seated Pigeon Pose",
            "primary"=> "Lower Back,Neck Flexors",
            "secondary"=> "Glute Max,Hip Flexors,Adductors,Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/951-seated-pigeon-pose-how-to-do-exercise"
        },
        1268=> {
            "name"=> "Seated Spiral Stretches",
            "primary"=> "Lower Back",
            "secondary"=> "Glute Max,Neck Flexors",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/948-seated-spiral-stretches-how-to-do-exercise"
        },
        1269=> {
            "name"=> "Pelvic Tilt Bridge",
            "primary"=> "Lower Abs,Glute Max,Lower Back",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga,Pilates",
            "url"=> "https://www.skimble.com/exercises/2237-pelvic-tilt-bridge-how-to-do-exercise"
        },
        1270=> {
            "name"=> "Rolling Back Stretch",
            "primary"=> "Lower Back",
            "secondary"=> "Rear Shoulders,Lats",
            "tags"=> "No Equipment,Warmup,Cooldown,Stretching,Balance",
            "url"=> "https://www.skimble.com/exercises/972-rolling-back-stretch-how-to-do-exercise"
        },
        1271=> {
            "name"=> "Seated Torso Twists",
            "primary"=> "Lower Back",
            "secondary"=> "Required Equipment: Chair",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/460-seated-torso-twists-how-to-do-exercise"
        },
        1272=> {
            "name"=> "Staff Pose",
            "primary"=> "Lats,Lower Back",
            "secondary"=> "Lower Abs",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1144-staff-pose-how-to-do-exercise"
        },
        1273=> {
            "name"=> "Thread the Needle Stretch",
            "primary"=> "Glute Max,Hip Flexors,Lower Back",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/953-thread-the-needle-stretch-how-to-do-exercise"
        },
        1274=> {
            "name"=> "Upward V",
            "primary"=> "Lower Abs,Lower Back,Neck Flexors",
            "secondary"=> "Hamstrings",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1274-upward-v-how-to-do-exercise"
        },
        1275=> {
            "name"=> "Bent Knee Hip Raises",
            "primary"=> "Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/881-bent-knee-hip-raises-how-to-do-exercise"
        },
        1276=> {
            "name"=> "Fifer Scissors",
            "primary"=> "Lower Abs,Neck Flexors",
            "secondary"=> "Upper Abs",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/827-fifer-scissors-how-to-do-exercise"
        },
        1277=> {
            "name"=> "Hip Rock N Raises",
            "primary"=> "Lower Abs,Neck Flexors",
            "secondary"=> "Upper Abs,Glute Max",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/828-hip-rock-n-raises-how-to-do-exercise"
        },
        1278=> {
            "name"=> "Hanging L Raises",
            "primary"=> "Lower Abs,Lats,Hip Flexors",
            "secondary"=> "Side Shoulders,Upper Abs",
            "tags"=> "Pull Up Bar,Home Equipment,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/1952-hanging-l-raises-how-to-do-exercise"
        },
        1279=> {
            "name"=> "Modified Boat Pose",
            "primary"=> "Upper Abs,Lower Abs",
            "secondary"=> "Hip Flexors",
            "tags"=> "Exercise Mat,Yoga,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2204-modified-boat-pose-how-to-do-exercise"
        },
        1280=> {
            "name"=> "Reverse Crunches",
            "primary"=> "Lower Abs",
            "secondary"=> "Upper Abs,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/981-reverse-crunches-how-to-do-exercise"
        },
        1281=> {
            "name"=> "Pulse Ups",
            "primary"=> "Lower Abs",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/829-pulse-ups-how-to-do-exercise"
        },
        1282=> {
            "name"=> "Teasers",
            "primary"=> "Lower Abs",
            "secondary"=> "Side Shoulders,Rear Shoulders,Upper Abs,Transverse Abdominis,Hip Flexors,Quads",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1672-teasers-how-to-do-exercise"
        },
        1283=> {
            "name"=> "Bicycle Crunches",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/110-bicycle-crunches-how-to-do-exercise"
        },
        1284=> {
            "name"=> "Ball Supported Left Oblique Crunch",
            "primary"=> "Left Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/2384-ball-supported-left-oblique-crunch-how-to-do-exercise"
        },
        1285=> {
            "name"=> "Cow Face Pose with Right Leg Straight",
            "primary"=> "Left Obliques,Hamstrings,Knee Flexors",
            "secondary"=> "Categories: Yoga,Stretching",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/3006-cow-face-pose-with-right-leg-straight-how-to-do-exercise"
        },
        1286=> {
            "name"=> "Floor Wipers",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/905-floor-wipers-how-to-do-exercise"
        },
        1287=> {
            "name"=> "Kneeling Right Side Plank",
            "primary"=> "Left Obliques,Glute Max",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Quads",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1816-kneeling-right-side-plank-how-to-do-exercise"
        },
        1288=> {
            "name"=> "Left Side Crunches",
            "primary"=> "Left Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2441-left-side-crunches-how-to-do-exercise"
        },
        1289=> {
            "name"=> "Left Oblique Ball Crunches",
            "primary"=> "Left Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Transverse Abdominis,Lower Back",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1644-left-oblique-ball-crunches-how-to-do-exercise"
        },
        1290=> {
            "name"=> "Lying Spinal Twist",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1924-lying-spinal-twist-how-to-do-exercise"
        },
        1291=> {
            "name"=> "Left Upward Woodchop with Band",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2355-left-upward-woodchop-with-band-how-to-do-exercise"
        },
        1292=> {
            "name"=> "Left Side Stretch",
            "primary"=> "Left Obliques,Lats",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/868-left-side-stretch-how-to-do-exercise"
        },
        1293=> {
            "name"=> "Matsyendra's Twist",
            "primary"=> "Left Obliques,Right Obliques,Glute Max",
            "secondary"=> "Lats,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1851-matsyendras-twist-how-to-do-exercise"
        },
        1294=> {
            "name"=> "Oblique Ball Crunches",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Upper Abs,Lower Abs,Hip Flexors,Quads",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1412-oblique-ball-crunches-how-to-do-exercise"
        },
        1295=> {
            "name"=> "Right Oblique V-Ups",
            "primary"=> "Left Obliques",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/831-right-oblique-v-ups-how-to-do-exercise"
        },
        1296=> {
            "name"=> "Right Downward Woodchop with Band",
            "primary"=> "Left Obliques,Right Obliques",
            "secondary"=> "Side Shoulders,Front Shoulders,Upper Abs,Lower Abs,Transverse Abdominis",
            "tags"=> "Resistance Bands,Strength",
            "url"=> "https://www.skimble.com/exercises/2356-right-downward-woodchop-with-band-how-to-do-exercise"
        },
        1297=> {
            "name"=> "Balancing Stick",
            "primary"=> "Side Shoulders,Lats,Glute Max,Hamstrings",
            "secondary"=> "Lower Abs,Traps,Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2253-balancing-stick-how-to-do-exercise"
        },
        1298=> {
            "name"=> "Alternating Side Reaches",
            "primary"=> "Lats",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "No Equipment,Warmup,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/985-alternating-side-reaches-how-to-do-exercise"
        },
        1299=> {
            "name"=> "Barbell Bent-Over Rows",
            "primary"=> "Lats",
            "secondary"=> "Required Equipment: Barbells",
            "tags"=> "Crossfit,Gym Equipment,Strength,",
            "url"=> "https://www.skimble.com/exercises/1167-barbell-bent-over-rows-how-to-do-exercise"
        },
        1300=> {
            "name"=> "Downward Facing Dog",
            "primary"=> "Lats",
            "secondary"=> "Hamstrings",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/223-downward-facing-dog-how-to-do-exercise"
        },
        1301=> {
            "name"=> "Goddess on Ball",
            "primary"=> "Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Yoga,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1625-goddess-on-ball-how-to-do-exercise"
        },
        1302=> {
            "name"=> "Half Lotus Forward Fold",
            "primary"=> "Lats,Glute Max,Hamstrings,Neck Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2205-half-lotus-forward-fold-how-to-do-exercise"
        },
        1303=> {
            "name"=> "Kneeling Right Arm Rows",
            "primary"=> "Lats",
            "secondary"=> "Rear Shoulders",
            "tags"=> "Dumbbells,Bench,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2454-kneeling-right-arm-rows-how-to-do-exercise"
        },
        1304=> {
            "name"=> "Kipping Pull-Ups",
            "primary"=> "Lats",
            "secondary"=> "Side Shoulders,Triceps,Biceps",
            "tags"=> "Pull Up Bar,Bodyweight,Crossfit,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/1949-kipping-pull-ups-how-to-do-exercise"
        },
        1305=> {
            "name"=> "Left Arm Hang",
            "primary"=> "Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Pull Up Bar,Bodyweight,Rock Climbing,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/1954-left-arm-hang-how-to-do-exercise"
        },
        1306=> {
            "name"=> "Left Lat Rolls",
            "primary"=> "Lats",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1647-left-lat-rolls-how-to-do-exercise"
        },
        1307=> {
            "name"=> "Lat Teres Rolls",
            "primary"=> "Lats,Teres Major",
            "secondary"=> "",
            "tags"=> ",",
            "url"=> "https://www.skimble.com/exercises/2448-lat-teres-rolls-how-to-do-exercise"
        },
        1308=> {
            "name"=> "Kneeling Left Arm Rows",
            "primary"=> "Lats",
            "secondary"=> "Rear Shoulders",
            "tags"=> "Dumbbells,Bench,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2455-kneeling-left-arm-rows-how-to-do-exercise"
        },
        1309=> {
            "name"=> "Head to Knee",
            "primary"=> "Lats,Hip Flexors,Hamstrings",
            "secondary"=> "Glute Max,Calves",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/1135-head-to-knee-how-to-do-exercise"
        },
        1310=> {
            "name"=> "Neutral Grip Pull-Ups",
            "primary"=> "Lats",
            "secondary"=> "Triceps,Biceps,Middle Chest,Rhomboids,Teres Major,Pec Minor,Elbow Flexors,Levator Scapula",
            "tags"=> "Pull Up Bar,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1955-neutral-grip-pull-ups-how-to-do-exercise"
        },
        1311=> {
            "name"=> "Pendlay Rows",
            "primary"=> "Lats,Back Extensors",
            "secondary"=> "Middle Chest,Traps,Glute Max,Adductors,Hamstrings,Elbow Flexors",
            "tags"=> "Barbells,Strength",
            "url"=> "https://www.skimble.com/exercises/2328-pendlay-rows-how-to-do-exercise"
        },
        1312=> {
            "name"=> "Pull-Ups",
            "primary"=> "Lats",
            "secondary"=> "Side Shoulders,Triceps,Biceps",
            "tags"=> "Pull Up Bar,Home Equipment,Crossfit,Rock Climbing,Strength",
            "url"=> "https://www.skimble.com/exercises/621-pull-ups-how-to-do-exercise"
        },
        1313=> {
            "name"=> "Long Foam Roller Back Rolls",
            "primary"=> "Lats",
            "secondary"=> "Lower Back",
            "tags"=> "Foam Roller,Home Equipment,Stretching",
            "url"=> "https://www.skimble.com/exercises/1586-long-foam-roller-back-rolls-how-to-do-exercise"
        },
        1314=> {
            "name"=> "Left Twisting Down Dog",
            "primary"=> "Lats,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2024-left-twisting-down-dog-how-to-do-exercise"
        },
        1315=> {
            "name"=> "Reverse Pull-Ups",
            "primary"=> "Lats",
            "secondary"=> "Side Shoulders,Triceps,Biceps",
            "tags"=> "Pull Up Bar,Home Equipment,Rock Climbing,Strength",
            "url"=> "https://www.skimble.com/exercises/45082-reverse-pull-ups-how-to-do-exercise"
        },
        1316=> {
            "name"=> "Seated Alternating Side Reaches",
            "primary"=> "Lats",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "Chair,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/1105-seated-alternating-side-reaches-how-to-do-exercise"
        },
        1317=> {
            "name"=> "Right Arm Hang",
            "primary"=> "Lats",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Pull Up Bar,Bodyweight,Gym Equipment",
            "url"=> "https://www.skimble.com/exercises/1953-right-arm-hang-how-to-do-exercise"
        },
        1318=> {
            "name"=> "Right Lat Rolls",
            "primary"=> "Lats",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1587-right-lat-rolls-how-to-do-exercise"
        },
        1319=> {
            "name"=> "Right Twisting Down Dog",
            "primary"=> "Lats,Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2023-right-twisting-down-dog-how-to-do-exercise"
        },
        1320=> {
            "name"=> "Side Bends",
            "primary"=> "Lats",
            "secondary"=> "Left Obliques,Right Obliques",
            "tags"=> "No Equipment,Warmup,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/139-side-bends-how-to-do-exercise"
        },
        1321=> {
            "name"=> "Standing Separate Leg Stretching Pose",
            "primary"=> "Lats,Glute Max,Hamstrings",
            "secondary"=> "Front Shoulders,Rear Shoulders,Traps",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2254-standing-separate-leg-stretching-pose-how-to-do-exercise"
        },
        1322=> {
            "name"=> "Sit-up with Stretching",
            "primary"=> "Lats,Glute Max,Hamstrings",
            "secondary"=> "Side Shoulders,Rear Shoulders,Calves",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2260-sit-up-with-stretching-how-to-do-exercise"
        },
        1323=> {
            "name"=> "Yoga Sidebends",
            "primary"=> "Lats",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/1904-yoga-sidebends-how-to-do-exercise"
        },
        1324=> {
            "name"=> "Weighted Pull-Ups",
            "primary"=> "Lats",
            "secondary"=> "Side Shoulders,Triceps,Biceps",
            "tags"=> "Pull Up Bar,Dumbbells,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/619-weighted-pull-ups-how-to-do-exercise"
        },
        1325=> {
            "name"=> "Floor Knee to Chest Stretch",
            "primary"=> "Hip Flexors,Quads",
            "secondary"=> "Lower Back,Neck Flexors",
            "tags"=> "No Equipment,Stretching",
            "url"=> "https://www.skimble.com/exercises/993-floor-knee-to-chest-stretch-how-to-do-exercise"
        },
        1326=> {
            "name"=> "Double Pigeon",
            "primary"=> "Glute Max,Hip Flexors",
            "secondary"=> "Adductors,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1136-double-pigeon-how-to-do-exercise"
        },
        1327=> {
            "name"=> "Happy Baby",
            "primary"=> "Hip Flexors",
            "secondary"=> "Glute Max,Adductors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1149-happy-baby-how-to-do-exercise"
        },
        1328=> {
            "name"=> "Easy Pose Meditation",
            "primary"=> "Hip Flexors",
            "secondary"=> "Lats",
            "tags"=> "Exercise Mat,Cooldown,Yoga",
            "url"=> "https://www.skimble.com/exercises/878-easy-pose-meditation-how-to-do-exercise"
        },
        1329=> {
            "name"=> "Left Low Kick Backs",
            "primary"=> "Glute Max,Hip Flexors,Abductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2134-left-low-kick-backs-how-to-do-exercise"
        },
        1330=> {
            "name"=> "Left Half Pigeon",
            "primary"=> "Glute Max,Hip Flexors",
            "secondary"=> "Adductors,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1874-left-half-pigeon-how-to-do-exercise"
        },
        1331=> {
            "name"=> "Pilates Right Side Kicks",
            "primary"=> "Glute Max,Hip Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2228-pilates-right-side-kicks-how-to-do-exercise"
        },
        1332=> {
            "name"=> "Modified Happy Baby",
            "primary"=> "Hip Flexors",
            "secondary"=> "Glute Max,Adductors",
            "tags"=> "Exercise Mat,Yoga,Stretching",
            "url"=> "https://www.skimble.com/exercises/3016-modified-happy-baby-how-to-do-exercise"
        },
        1333=> {
            "name"=> "Pilates Left Side Kicks",
            "primary"=> "Glute Max,Hip Flexors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2229-pilates-left-side-kicks-how-to-do-exercise"
        },
        1334=> {
            "name"=> "Right Half Pigeon",
            "primary"=> "Glute Max,Hip Flexors",
            "secondary"=> "Adductors,Lower Back",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1871-right-half-pigeon-how-to-do-exercise"
        },
        1335=> {
            "name"=> "Right Low Kick Backs",
            "primary"=> "Glute Max,Hip Flexors,Abductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2133-right-low-kick-backs-how-to-do-exercise"
        },
        1336=> {
            "name"=> "Right Low Glute Kicks",
            "primary"=> "Glute Max,Hip Flexors,Abductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Pilates,Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/2227-right-low-glute-kicks-how-to-do-exercise"
        },
        1337=> {
            "name"=> "Seated Hip Flexor Lifts",
            "primary"=> "Hip Flexors",
            "secondary"=> "Glute Max,Quads,Calves",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1049-seated-hip-flexor-lifts-how-to-do-exercise"
        },
        1338=> {
            "name"=> "Backwards Elliptical",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis,Quads,Lower Back",
            "tags"=> "Cardio Machine,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1826-backwards-elliptical-how-to-do-exercise"
        },
        1339=> {
            "name"=> "Ball Prone Leg Lift",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Required Equipment: Stability Ball",
            "tags"=> "Home Equipment,",
            "url"=> "https://www.skimble.com/exercises/2382-ball-prone-leg-lift-how-to-do-exercise"
        },
        1340=> {
            "name"=> "90 Lat Stretch",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: Wall",
            "tags"=> "Warmup,Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/899-90-lat-stretch-how-to-do-exercise"
        },
        1341=> {
            "name"=> "Alternating Kettlebell Swings",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "Kettlebells,Home Equipment,Crossfit,Strength",
            "url"=> "https://www.skimble.com/exercises/841-alternating-kettlebell-swings-how-to-do-exercise"
        },
        1342=> {
            "name"=> "Barbell Stiff Legged Deadlift",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Lats",
            "tags"=> "Barbells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1968-barbell-stiff-legged-deadlift-how-to-do-exercise"
        },
        1343=> {
            "name"=> "Bent Single Leg Floor Bridges",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1097-bent-single-leg-floor-bridges-how-to-do-exercise"
        },
        1344=> {
            "name"=> "BOSU Left Leg Floor Bridges",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1175-bosu-left-leg-floor-bridges-how-to-do-exercise"
        },
        1345=> {
            "name"=> "Buddy Hamstring Stretches",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Stretching,Partner,",
            "url"=> "https://www.skimble.com/exercises/2122-buddy-hamstring-stretches-how-to-do-exercise"
        },
        1346=> {
            "name"=> "BOSU Right Leg Floor Bridges",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1174-bosu-right-leg-floor-bridges-how-to-do-exercise"
        },
        1347=> {
            "name"=> "BOSU Floor Bridge",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "BOSU,Gym Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1173-bosu-floor-bridge-how-to-do-exercise"
        },
        1348=> {
            "name"=> "Bridge with Heel Digs on Ball",
            "primary"=> "Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1293-bridge-with-heel-digs-on-ball-how-to-do-exercise"
        },
        1349=> {
            "name"=> "Dumbbell Deadlifts",
            "primary"=> "Glute Max,Hamstrings,Lower Back,Back Extensors",
            "secondary"=> "Required Equipment: Dumbbells",
            "tags"=> "Crossfit,Strength,",
            "url"=> "https://www.skimble.com/exercises/2340-dumbbell-deadlifts-how-to-do-exercise"
        },
        1350=> {
            "name"=> "Dumbbell Single Leg Seesaws",
            "primary"=> "Hamstrings",
            "secondary"=> "Glute Max,Lower Back,Back Extensors",
            "tags"=> "Dumbbells,Home Equipment,Balance,Strength",
            "url"=> "https://www.skimble.com/exercises/926-dumbbell-single-leg-seesaws-how-to-do-exercise"
        },
        1351=> {
            "name"=> "Frankenstein Walk",
            "primary"=> "Hamstrings",
            "secondary"=> "Glute Max",
            "tags"=> "No Equipment,Running,Cardio",
            "url"=> "https://www.skimble.com/exercises/1417-frankenstein-walk-how-to-do-exercise"
        },
        1352=> {
            "name"=> "Floor Bridge",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/922-floor-bridge-how-to-do-exercise"
        },
        1353=> {
            "name"=> "Fast Backwards Elliptical",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Required Equipment: Cardio Machine",
            "tags"=> "Gym Equipment,Cardio,",
            "url"=> "https://www.skimble.com/exercises/1700-fast-backwards-elliptical-how-to-do-exercise"
        },
        1354=> {
            "name"=> "Floor Bridge Lifts with Bench",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis,Quads",
            "tags"=> "Bench,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2389-floor-bridge-lifts-with-bench-how-to-do-exercise"
        },
        1355=> {
            "name"=> "Hamstring Curls",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: Chair",
            "tags"=> "Bodyweight,",
            "url"=> "https://www.skimble.com/exercises/1106-hamstring-curls-how-to-do-exercise"
        },
        1356=> {
            "name"=> "Hamstring Kickbacks",
            "primary"=> "Hamstrings",
            "secondary"=> "Glute Max,Lower Back",
            "tags"=> "Chair,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1048-hamstring-kickbacks-how-to-do-exercise"
        },
        1357=> {
            "name"=> "Hamstring Stretches",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/967-hamstring-stretches-how-to-do-exercise"
        },
        1358=> {
            "name"=> "Hamstring Rolls",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1381-hamstring-rolls-how-to-do-exercise"
        },
        1359=> {
            "name"=> "Knee Folds",
            "primary"=> "Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Lower Back",
            "tags"=> "No Equipment,Stretching",
            "url"=> "https://www.skimble.com/exercises/1345-knee-folds-how-to-do-exercise"
        },
        1360=> {
            "name"=> "Left Modified Pyramid",
            "primary"=> "Hamstrings,Calves",
            "secondary"=> "Lats,Glute Max",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1844-left-modified-pyramid-how-to-do-exercise"
        },
        1361=> {
            "name"=> "Left Hamstring Stretch",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/869-left-hamstring-stretch-how-to-do-exercise"
        },
        1362=> {
            "name"=> "Left Side Kettlebell Clean",
            "primary"=> "Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Glute Max,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2045-left-side-kettlebell-clean-how-to-do-exercise"
        },
        1363=> {
            "name"=> "Left IT Band Stretch",
            "primary"=> "Hamstrings,Abductors",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Cooldown,Stretching,",
            "url"=> "https://www.skimble.com/exercises/2246-left-it-band-stretch-how-to-do-exercise"
        },
        1364=> {
            "name"=> "Left Hamstring Rolls",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Stretching,",
            "url"=> "https://www.skimble.com/exercises/1716-left-hamstring-rolls-how-to-do-exercise"
        },
        1365=> {
            "name"=> "Left Split",
            "primary"=> "Hamstrings",
            "secondary"=> "Upper Chest",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1916-left-split-how-to-do-exercise"
        },
        1366=> {
            "name"=> "Lying Hamstring Stretches",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/968-lying-hamstring-stretches-how-to-do-exercise"
        },
        1367=> {
            "name"=> "Quick Box Step Ups",
            "primary"=> "Glute Max,Quads,Hamstrings",
            "secondary"=> "Calves,Plantar Flexors",
            "tags"=> "Box or Step,Bodyweight,Cardio",
            "url"=> "https://www.skimble.com/exercises/2052-quick-box-step-ups-how-to-do-exercise"
        },
        1368=> {
            "name"=> "Right Runner's Lunge",
            "primary"=> "Glute Max,Hamstrings,Neck Flexors",
            "secondary"=> "Glute Max,Quads",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/857-right-runners-lunge-how-to-do-exercise"
        },
        1369=> {
            "name"=> "Right Hamstring Rolls",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Stretching,",
            "url"=> "https://www.skimble.com/exercises/1715-right-hamstring-rolls-how-to-do-exercise"
        },
        1370=> {
            "name"=> "Right Hamstring Stretch",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Warmup,Cooldown,Bodyweight,Stretching,",
            "url"=> "https://www.skimble.com/exercises/866-right-hamstring-stretch-how-to-do-exercise"
        },
        1371=> {
            "name"=> "Right Side Kettlebell Clean",
            "primary"=> "Hamstrings",
            "secondary"=> "Side Shoulders,Front Shoulders,Rear Shoulders,Traps,Glute Max,Lower Back",
            "tags"=> "Kettlebells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2044-right-side-kettlebell-clean-how-to-do-exercise"
        },
        1372=> {
            "name"=> "Right Split",
            "primary"=> "Hamstrings",
            "secondary"=> "Upper Chest",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/1915-right-split-how-to-do-exercise"
        },
        1373=> {
            "name"=> "Rotating Toe Touches",
            "primary"=> "Hamstrings",
            "secondary"=> "Left Obliques,Right Obliques,Calves,Lower Back",
            "tags"=> "No Equipment,Warmup,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1422-rotating-toe-touches-how-to-do-exercise"
        },
        1374=> {
            "name"=> "Rolling Butterfly with Leg Extension",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Hip Flexors,Adductors,Lower Back",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1757-rolling-butterfly-with-leg-extension-how-to-do-exercise"
        },
        1375=> {
            "name"=> "Seated Leg Stretch",
            "primary"=> "Hamstrings",
            "secondary"=> "Lower Back",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/935-seated-leg-stretch-how-to-do-exercise"
        },
        1376=> {
            "name"=> "Snatch",
            "primary"=> "Hamstrings",
            "secondary"=> "Triceps,Glute Max,Quads,Lower Back",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/3455-snatch-how-to-do-exercise"
        },
        1377=> {
            "name"=> "Stacked Hamstring Rolls",
            "primary"=> "Hamstrings",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1382-stacked-hamstring-rolls-how-to-do-exercise"
        },
        1378=> {
            "name"=> "Stability Ball Hamstring Curls",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1408-stability-ball-hamstring-curls-how-to-do-exercise"
        },
        1379=> {
            "name"=> "Stability Ball Leg Curls",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Upper Abs,Lower Abs,Left Obliques,Right Obliques,Transverse Abdominis",
            "tags"=> "Stability Ball,Home Equipment,Balance",
            "url"=> "https://www.skimble.com/exercises/1407-stability-ball-leg-curls-how-to-do-exercise"
        },
        1380=> {
            "name"=> "Straight Single Leg Floor Bridges",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Transverse Abdominis",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1096-straight-single-leg-floor-bridges-how-to-do-exercise"
        },
        1381=> {
            "name"=> "Wall Hamstring Stretches",
            "primary"=> "Hamstrings",
            "secondary"=> "Rear Shoulders,Calves",
            "tags"=> "Wall,Cooldown,Stretching",
            "url"=> "https://www.skimble.com/exercises/1086-wall-hamstring-stretches-how-to-do-exercise"
        },
        1382=> {
            "name"=> "Ball Butt Lifts",
            "primary"=> "Glute Max",
            "secondary"=> "Hamstrings",
            "tags"=> "Stability Ball,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1304-ball-butt-lifts-how-to-do-exercise"
        },
        1383=> {
            "name"=> "Advanced Left Glute Rolls",
            "primary"=> "Glute Max,Abductors",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1376-advanced-left-glute-rolls-how-to-do-exercise"
        },
        1384=> {
            "name"=> "Advanced Right Glute Rolls",
            "primary"=> "Glute Max,Abductors",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1443-advanced-right-glute-rolls-how-to-do-exercise"
        },
        1385=> {
            "name"=> "Barbell Glute Bridge",
            "primary"=> "Glute Max",
            "secondary"=> "Hamstrings,Abductors",
            "tags"=> "Barbells,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/2275-barbell-glute-bridge-how-to-do-exercise"
        },
        1386=> {
            "name"=> "Donkey Whips",
            "primary"=> "Glute Max",
            "secondary"=> "Side Shoulders,Front Shoulders,Adductors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1750-donkey-whips-how-to-do-exercise"
        },
        1387=> {
            "name"=> "Double Leg Kick",
            "primary"=> "Glute Max",
            "secondary"=> "Upper Abs,Lower Abs",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1682-double-leg-kick-how-to-do-exercise"
        },
        1388=> {
            "name"=> "Glute Circles",
            "primary"=> "Glute Max",
            "secondary"=> "Side Shoulders,Rear Shoulders,Adductors,Abductors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1679-glute-circles-how-to-do-exercise"
        },
        1389=> {
            "name"=> "Fold Over",
            "primary"=> "Glute Max",
            "secondary"=> "Transverse Abdominis,Adductors,Quads",
            "tags"=> "Chair,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1996-fold-over-how-to-do-exercise"
        },
        1390=> {
            "name"=> "Glutes 100",
            "primary"=> "Glute Max",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2117-glutes-100-how-to-do-exercise"
        },
        1391=> {
            "name"=> "Glute Kickbacks",
            "primary"=> "Glute Max,Neck Flexors",
            "secondary"=> "Adductors,Hamstrings",
            "tags"=> "No Equipment,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1160-glute-kickbacks-how-to-do-exercise"
        },
        1392=> {
            "name"=> "High Glute Kickbacks",
            "primary"=> "Glute Max",
            "secondary"=> "Side Shoulders,Front Shoulders,Hamstrings",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1749-high-glute-kickbacks-how-to-do-exercise"
        },
        1393=> {
            "name"=> "Hot Style Tree Pose",
            "primary"=> "Glute Max,Hip Flexors",
            "secondary"=> "Quads",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2257-hot-style-tree-pose-how-to-do-exercise"
        },
        1394=> {
            "name"=> "Horse Stance with Clasped Hands",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Yoga,Stretching,",
            "url"=> "https://www.skimble.com/exercises/3014-horse-stance-with-clasped-hands-how-to-do-exercise"
        },
        1395=> {
            "name"=> "Hot Style Locust Pose",
            "primary"=> "Glute Max,Hamstrings",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Yoga,",
            "url"=> "https://www.skimble.com/exercises/2261-hot-style-locust-pose-how-to-do-exercise"
        },
        1396=> {
            "name"=> "Lateral Leg Lifts on a Bench",
            "primary"=> "Glute Max,Abductors",
            "secondary"=> "Adductors,Quads,Hamstrings",
            "tags"=> "Box or Step,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1042-lateral-leg-lifts-on-a-bench-how-to-do-exercise"
        },
        1397=> {
            "name"=> "Left Bulgarian Split Squats with Dumbbells",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Hamstrings",
            "tags"=> "Dumbbells,Box or Step,Home Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/1432-left-bulgarian-split-squats-with-dumbbells-how-to-do-exercise"
        },
        1398=> {
            "name"=> "Left Lateral Leg Lifts",
            "primary"=> "Glute Max,Abductors",
            "secondary"=> "Adductors",
            "tags"=> "Chair,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2056-left-lateral-leg-lifts-how-to-do-exercise"
        },
        1399=> {
            "name"=> "Left Glute Rolls",
            "primary"=> "Glute Max,Abductors",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1375-left-glute-rolls-how-to-do-exercise"
        },
        1400=> {
            "name"=> "Left Low Glute Kicks",
            "primary"=> "Glute Max,Hip Flexors,Abductors",
            "secondary"=> "Left Obliques,Right Obliques,Transverse Abdominis,Quads",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2163-left-low-glute-kicks-how-to-do-exercise"
        },
        1401=> {
            "name"=> "Left Leg Lateral Step Up",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2365-left-leg-lateral-step-up-how-to-do-exercise"
        },
        1402=> {
            "name"=> "Lying Scorpions",
            "primary"=> "Glute Max",
            "secondary"=> "Left Obliques,Right Obliques,Hip Flexors,Adductors,Neck Flexors",
            "tags"=> "No Equipment,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1748-lying-scorpions-how-to-do-exercise"
        },
        1403=> {
            "name"=> "Pause Deadlifts",
            "primary"=> "Glute Max",
            "secondary"=> "Quads,Hamstrings",
            "tags"=> "Barbells,Crossfit,Gym Equipment,Strength",
            "url"=> "https://www.skimble.com/exercises/37379-pause-deadlifts-how-to-do-exercise"
        },
        1404=> {
            "name"=> "Pretzel Stretches",
            "primary"=> "Glute Max",
            "secondary"=> "Hip Flexors,Lower Back",
            "tags"=> "No Equipment,Warmup,Cooldown,Bodyweight,Stretching",
            "url"=> "https://www.skimble.com/exercises/969-pretzel-stretches-how-to-do-exercise"
        },
        1405=> {
            "name"=> "Pretzel",
            "primary"=> "Glute Max",
            "secondary"=> "Adductors,Lower Back",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1997-pretzel-how-to-do-exercise"
        },
        1406=> {
            "name"=> "Right Glute Rolls",
            "primary"=> "Glute Max,Abductors",
            "secondary"=> "Required Equipment: Foam Roller",
            "tags"=> "Cooldown,Home Equipment,Stretching,",
            "url"=> "https://www.skimble.com/exercises/1441-right-glute-rolls-how-to-do-exercise"
        },
        1407=> {
            "name"=> "Right Lateral Leg Lifts",
            "primary"=> "Glute Max,Abductors",
            "secondary"=> "Adductors",
            "tags"=> "Chair,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2055-right-lateral-leg-lifts-how-to-do-exercise"
        },
        1408=> {
            "name"=> "Right IT Band Stretch",
            "primary"=> "Glute Max",
            "secondary"=> "Required Equipment: No Equipment",
            "tags"=> "Stretching,",
            "url"=> "https://www.skimble.com/exercises/1284-right-it-band-stretch-how-to-do-exercise"
        },
        1409=> {
            "name"=> "Right Leg Lateral Step Up",
            "primary"=> "Glute Max,Quads",
            "secondary"=> "Adductors,Hamstrings,Calves,Abductors",
            "tags"=> "Box or Step,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2366-right-leg-lateral-step-up-how-to-do-exercise"
        },
        1410=> {
            "name"=> "Right Leg Lifts on a Bench",
            "primary"=> "Glute Max,Adductors,Abductors",
            "secondary"=> "Hip Flexors,Quads",
            "tags"=> "Box or Step,Bodyweight,Home Equipment",
            "url"=> "https://www.skimble.com/exercises/1120-right-leg-lifts-on-a-bench-how-to-do-exercise"
        },
        1411=> {
            "name"=> "Shin Grabs",
            "primary"=> "Glute Max,Piriformis",
            "secondary"=> "Required Equipment: Exercise Mat",
            "tags"=> "Stretching,",
            "url"=> "https://www.skimble.com/exercises/1751-shin-grabs-how-to-do-exercise"
        },
        1412=> {
            "name"=> "Standing Seat Work",
            "primary"=> "Glute Max",
            "secondary"=> "Quads,Lower Back",
            "tags"=> "Chair,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/1995-standing-seat-work-how-to-do-exercise"
        },
        1413=> {
            "name"=> "Tip Toe Glute Bridge",
            "primary"=> "Glute Max",
            "secondary"=> "Calves,Plantar Flexors",
            "tags"=> "Exercise Mat,Pilates,Bodyweight",
            "url"=> "https://www.skimble.com/exercises/2203-tip-toe-glute-bridge-how-to-do-exercise"
        },
        1418=> {
            "name"=> "Advanced Left Lizard",
            "primary"=> "Hip Flexors,Adductors",
            "secondary"=> "Glute Max,Neck Flexors",
            "tags"=> "Exercise Mat,Yoga",
            "url"=> "https://www.skimble.com/exercises/2243-advanced-left-lizard-how-to-do-exercise"
        }
    }

    @exercise = nil
    @hash.each do |id, exercise|
      exercise.each do |key, value|
        if key == "name"
          @exercise = Exercise.find_by(name: value)
          if @exercise == nil
            @exercise = Exercise.new(:name => value)
            @exercise.save
          end

        end
        if key == "primary"
          pmuscles = value.split(",")
          pmuscles.each do |musclename|
            muscle = Muscle.find_by(en_name: musclename)
            if muscle == nil
              muscle = Muscle.new(:en_name => musclename)
              muscle.save
            end
            muscle_id = muscle.id
            @exercise_to_muscle = ExerciseToMuscle.find_by(muscle_id: muscle_id, muscle_type: "primary", exercise_id: @exercise.id)
            if @exercise_to_muscle == nil
              @exercise_to_muscle = ExerciseToMuscle.new(:muscle_id => muscle_id, :muscle_type => "primary", :exercise_id => @exercise.id, :body_part_id => 1)
              @exercise_to_muscle.save
            end
          end
        end
        if key == "secondary"
          if value.include? "Categories: "
            tags = value.split("Categories: ")[1].split(",")
            tags.each do |tag_name|
              @tag = Tag.find_by(name: tag_name)
              if @tag == nil
                @tag = Tag.new(:name => tag_name)
                @tag.save
              end
              if TagToExercise.find_by(tag_id: @tag.id,exercise_id:@exercise.id) == nil
                  @exercise.tags << @tag
              end
            end
          elsif value.include? "Required Equipment: "
            tags = value.split("Required Equipment: ")[1].split(",")
            tags.each do |tag_name|
              @tag = Tag.find_by(name: tag_name)
              if @tag == nil
                @tag = Tag.new(:name => tag_name)
                @tag.save
              end
              if TagToExercise.find_by(tag_id: @tag.id, exercise_id: @exercise.id) == nil
                  @exercise.tags << @tag
              end
            end

            #elsif value.include? "Secondary Muscle Groups: "

          else
              smuscles = value.split(",")
              smuscles.each do |musclename|
                  muscle = Muscle.find_by(en_name: musclename)
                  if muscle == nil
                      muscle = Muscle.new(:en_name => musclename)
                      muscle.save
                  end
                  muscle_id = muscle.id
                  @exercise_to_muscle = ExerciseToMuscle.find_by(muscle_id: muscle_id, muscle_type: "secondary", exercise_id: @exercise.id)
                  if @exercise_to_muscle == nil
                      @exercise_to_muscle = ExerciseToMuscle.new(:muscle_id => muscle_id, :muscle_type => "secondary", :exercise_id => @exercise.id, :body_part_id => 1)
                      @exercise_to_muscle.save
                  end

              end
          end
        end
        if key == "tags"
          tags = value.split(",")
          tags.each do |tag_name|
            @tag = Tag.find_by(name: tag_name)
            if @tag == nil
              @tag = Tag.new(:name => tag_name)
              @tag.save
            end
            if TagToExercise.find_by(tag_id: @tag.id, exercise_id: @exercise.id) == nil
                @exercise.tags << @tag
            end
          end
        end
        if key == "url"
          @exercise.description = value
          @exercise.save
        end
      end
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show

  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    unless creator_of_video
      redirect_to videos_path(params[:id])
    end
  end

  # POST /videos
  # POST /videos.json
  def create

    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        current_user.videos << @video
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    unless creator_of_video
      redirect_to videos_path(params[:id])
    end
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    #@video.destroy
    #respond_to do |format|
    #  format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private

  def creator_of_video
    ttu = current_user && UserToVideo.find_by(video_id: params[:id], user_id: current_user.id)

  end

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.permit!
    params.fetch(:video, {})
  end
end
