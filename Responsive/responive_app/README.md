# Responsive Steps :
### add breakpoint to Material App

```dart
return MaterialApp(
  builder: (context, widget) => ResponsiveWrapper.builder(
    ClampingScrollWrapper.builder(context, widget!),
    breakpoints: const [
      ResponsiveBreakpoint.resize(350, name: MOBILE),
      ResponsiveBreakpoint.autoScale(600, name: TABLET),
      ResponsiveBreakpoint.resize(800, name: DESKTOP),
      ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
    ],
  ),
```

### uso one the below Tools

#### column to row
```dart
ResponsiveRowColumn(
  rowMainAxisAlignment: MainAxisAlignment.center,
  rowPadding: const EdgeInsets.all(30),
  columnPadding: const EdgeInsets.all(30),
  layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      ? ResponsiveRowColumnType.COLUMN
      : ResponsiveRowColumnType.ROW,
  children: [
    ResponsiveRowColumnItem(
      rowFlex: 1,
      child: CourseTile(course: courses[0]),
    ),
    ResponsiveRowColumnItem(
      rowFlex: 1,
      child: CourseTile(course: courses[1]),
    ),
  ],
),
```

#### responsive Value

```dart
var responsiveValue = ResponsiveValue<double>(context, defaultValue: 350, valueWhen:[
      const Condition.largerThan(
        name: MOBILE,
        value: 500,
      ),
    ]);

width: responsiveValue.value ?? 350,
```

#### Responsive visibility

```dart
leading: ResponsiveVisibility(
  hiddenWhen: const [
    Condition.largerThan(name: TABLET),
  ],
  child: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.menu),
  ),
),
```

#### Responsive Conditions 

```dart
 if(ResponsiveWrapper.of(context).isLargerThan(MOBILE)){
  
 }
```
#### Responsive scaled Width Some time is SomeTimes Useful

```dart
ResponsiveWrapper.of(context).scaledWidth
```

