
import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {

  bool switchValue;
  double sliderValue;

  SwitchStates({
    this.switchValue = false,
    this.sliderValue = 0.3
});

  SwitchStates copyWith({bool? switchValue, double? sliderValue}){
    return SwitchStates(
      switchValue : switchValue ?? this.switchValue,
      sliderValue : sliderValue ?? this.sliderValue
    );
}



  @override

  List<Object?> get props => [switchValue, sliderValue];
}