//
//  DashboardUseCase.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 29/09/24.
//

class DashboardBlogUseCase {
    
    private let repository: DashboardRepository

    init(dashboardRepository: DashboardRepository) {
        self.repository = dashboardRepository
    }

    func execute(sort: SortingType?, filter: String?, completion: @escaping (Result<SpaceFlightResponse, Error>) -> Void) {
        repository.getBlogs(sort: sort, filter: filter, completion: completion)
    }
}
