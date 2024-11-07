function ordenarMovimientos(moveNames) {
  var orderedMoveNames = [];
  for (var i = 0; i < moveNames.length; i++) {
    var name = moveNames[i];
    var inserted = false;
    for (var j = 0; j < orderedMoveNames.length; j++) {
      if (name < orderedMoveNames[j]) {
        orderedMoveNames.splice(j, 0, name);
        inserted = true;
        break;
      }
    }
    if (!inserted) {
      orderedMoveNames.push(name);
    }
  }
  return orderedMoveNames;
}