function Stall(poi, direction, change) {
  this.poi = poi; // right, left
  this.direction = direction; // front, back
  this.change = change; // true, false
}

function Turn(direction, rotation) {
  this.direction = direction; // right, left
  this.rotation = rotation; // half, quarter
}

function DropStall(poi) {
  this.poi = poi; // right, left
}
