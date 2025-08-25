import app from "ags/gtk4/app"
import GLib from "gi://GLib"
import Astal from "gi://Astal?version=4.0"
import Gdk from "gi://Gdk?version=4.0"
import AstalBattery from "gi://AstalBattery"
import AstalHyprland from "gi://AstalHyprland"
import { createBinding } from "ags"
import { createPoll } from "ags/time"

function Clock() {
  const time = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%H:%M ")!
  })

  return (
    <box $type="start">
      <label label={time} />
    </box>
  )
}

function Battery() {
  const battery = AstalBattery.get_default()

  const percent = createBinding(
    battery,
    "percentage",
  )((p) => `${Math.floor(p * 100)}%`)

  return (
    <box>
      <label label={percent} />
    </box>
  )
}

function QuickActions() {
  return (
    <image file="/home/lousp/Alix/assets/showcase/lockscreen.png" pixelSize={200} />
  )
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name="bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox>
        <box $type="start">
        </box>
        <box $type="end">
          <menubutton class="optionsmenu">
            <box>
              <Clock />
              <Battery />
            </box>
            <popover>
              <QuickActions />
            </popover>
          </menubutton>
        </box>
      </centerbox>
    </window>
  )
}
