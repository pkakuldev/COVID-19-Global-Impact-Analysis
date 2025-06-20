select * 
from covid.coviddeaths
where continent is not null
order by 3,4;

select * 
from covid.covidvaccinations;

--

select location,date, total_cases, new_cases, total_deaths, population
from covid.coviddeaths
order by 1,2;

-- TOTAL CASES versus TOTAL DEATHS
-- Displays the probability of dying from COVID-19 if infected, by country.

select location,date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from covid.coviddeaths
where location like '%india%'
order by 1,2;

-- TOTAL CASES versus TOTAL POULATION
-- Displays the proportion of the population that tested positive for COVID-19

select location,date, total_cases, new_cases, population, (total_cases/population)*100 as PopulationPercentage
from covid.coviddeaths
where continent is not null
order by 1,2;


-- Countrys with Highest Infection rate Compared to Population

select location,population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population)*100) as PopulationPercentage
from covid.coviddeaths
where continent is not null
group by population, location
order by PopulationPercentage desc;

-- Displays Countries with the Highest COVID-19 Death rate per Population

select location, 
Max(cast(Total_deaths as UNSIGNED )) as TotalDeathCount
from covid.coviddeaths 
where continent is not null
group by location  
order by TotalDeathCount desc;


-- Group this Data by Continent (Showing Death Count per Population across Continents)

select continent, Max(cast(Total_deaths as UNSIGNED )) as TotalDeathCount
from covid.coviddeaths 
where continent is not null
group by continent  
order by TotalDeathCount desc;

-- Global Number

select date, sum(new_cases) as Total_Cases, sum(cast(new_deaths as UNSIGNED)) as Total_Death, 
(sum(cast(new_deaths as UNSIGNED))/sum(new_cases))*100 as DeathPercentage
from covid.coviddeaths
-- where location like '%india%'
where continent is not null
group by date
order by 1,2;

-- Analyzing total population versus number of vaccination

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as UNSIGNED)) over (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from covid.coviddeaths dea 
join covid.covidvaccinations vac 
on  
dea.location= vac.location and dea.date = vac.date
where dea.continent is not null
order by 2,3;

-- Use CTE

with PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as UNSIGNED)) over (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from covid.coviddeaths dea 
join covid.covidvaccinations vac 
on  
dea.location= vac.location and dea.date = vac.date
where dea.continent is not null
order by 2,3
)
select *, (RollingPeopleVaccinated/population)*100
from PopvsVac;

-- TEMP TABLE

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated

--  Creating a view to store data for future visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

