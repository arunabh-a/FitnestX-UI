
class PopularSec {
    String name;
    String iconPath;
    String level;
    String duration;
    String calorie;
    bool boxIsSelected;

    PopularSec({
        required this.name,
        required this.iconPath,
        required this.level,
        required this.duration,
        required this.calorie,
        required this.boxIsSelected,
    });

    static List <PopularSec> getPopularSec() {
        List <PopularSec> popularDiets = [];

        popularDiets.add(
            PopularSec(
                name: 'Blueberry Pancake',
                iconPath: 'assets/icons/blueberry-pancake.svg',
                level: 'Medium',
                duration: '30 min',
                calorie: '230 kcal',
                boxIsSelected: true,
            )
        );

        popularDiets.add(
            PopularSec(
                name: 'Salmon Nigiri',
                iconPath: 'assets/icons/salmon-nigiri.svg',
                level: 'Medium',
                duration: '20 min',
                calorie: '120 kcal',
                boxIsSelected: false,
            )
        );

        return popularDiets;
    }
}