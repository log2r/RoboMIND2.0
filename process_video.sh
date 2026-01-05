#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/log2r/Documents/Projects/RoboMIND2.0"
SCRIPT="${ROOT}/process_video.py"
OUT_ROOT="${ROOT}/demoooos"

VIDEOS=(
  "/Users/log2r/Documents/Projects/RoboMIND2.0/demos/collab_mob_tasks_1/demo.mp4"
  "/Users/log2r/Documents/Projects/RoboMIND2.0/demos/collab_mob_tasks_2/demo.mp4"
  "/Users/log2r/Documents/Projects/RoboMIND2.0/demos/collab_mob_tasks_3/demo.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_mob_training_tasks_agilex_arrange_dishes/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_mob_training_tasks_agilex_cobotmagic2_dualArm-gripper-3cameras_5_navigate_clean/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_mob_training_tasks_agilex_cobotmagic2_dualArm-gripper-3cameras_5_navigate_insert_tube/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_mob_training_tasks_agilex_cobotmagic2_dualArm-gripper-3cameras_5_navigate_move_to_plate/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_training_tasks_agilex_2_make_sandwich/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_training_tasks_agilex_2_pour_meat_into_the_plate/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_training_tasks_agilex_cobotmagic2_dualArm-gripper-3cameras_2_assemble_PVC_drainage_pipe_clamps/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_training_tasks_agilex_cobotmagic2_dualArm-gripper-3cameras_2_make_sandwich_and_place_on_tray_250507/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_training_tasks_agilex_cobotmagic2_dualArm-gripper-3cameras_2_move_yellow_beetle_car_and_pick_and_place_it_into_the_blue_storage_box_20250430/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/agilex_training_tasks_gpt_agilex_cobotmagic2_dualArm-gripper-3cameras_2_sort_parts_20250527/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ark_training_tasks_ark_02_collect_button/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ark_training_tasks_ark_03_insert_blue_toy_into_slot_250807/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ark_training_tasks_ark_1_dual_1_place_the_milk/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ark_training_tasks_ark_1_select_workpiece/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ark_training_tasks_ark_dual1_cross_move_apple_from_plate_to_bowl_250511/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ark_training_tasks_gpt_ark_1_sort_fruits_250519/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/franka_tasks_task1/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/franka_tasks_task2/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/franka_tasks_task3/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/franka_tasks_task4/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/franka_tasks_task5/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/franka_tasks_task6/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tianyi_mob_training_tasks_tienkung_prod2_dualArm-dexHand-1cameras_1_clean_the_dust/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tianyi_mob_training_tasks_tienkung_prod2_dualArm-dexHand-1cameras_1_Pick_and_Place_apple/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tianyi_mob_training_tasks_tienkung_prod2_dualArm-dexHand-1cameras_1_pick_and_place_onto_desktop/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tianyi_mob_training_tasks_tienkung_prod2_dualArm-dexHand-1cameras_1_pick_and_place_yellow_cube_in_box/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tienkung_training_tasks_tienkung_pro2_2_open_pot_lid/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tienkung_training_tasks_tienkung_pro2_2_stack_the_cup/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tienkung_training_tasks_tienkung_pro2_dualArm-gripper-1cameras_2_1_find_out_circuit_breaker_into_the_other_tray/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tienkung_training_tasks_tienkung_pro2_dualArm-gripper-1cameras_2_pour_oil_for_gear/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tienkung_training_tasks_tienkung_pro2_dualArm-gripper-1cameras_2_press_stop_button_of_control_box/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/tienkung_training_tasks_tienkung_pro2_dualArm-gripper-1cameras_2_sweep_electronic_rubbish/camera_top_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ur_training_tasks_ur_training_task_1/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ur_training_tasks_ur_training_task_2/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ur_training_tasks_ur_training_task_3/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ur_training_tasks_ur_training_task_4/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ur_training_tasks_ur_training_task_5/camera_front_video.mp4"
# "/Users/log2r/Documents/Projects/RoboMIND2.0/static/videos/ur_training_tasks_ur_training_task_6/camera_front_video.mp4"
)

echo "[INFO] Total videos: ${#VIDEOS[@]}"

for video in "${VIDEOS[@]}"; do
  if [[ ! -f "${video}" ]]; then
    echo "[WARN] Missing file: ${video}"
    continue
  fi

  task_name="$(basename "$(dirname "${video}")")"
  out_dir="${OUT_ROOT}/${task_name}"

  echo "[RUN] ${task_name}"
  python "${SCRIPT}" \
    --input "${video}" \
    --out_dir "${out_dir}"
done

echo "[DONE] All videos processed."
